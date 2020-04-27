from .models import *
from .forms import *
from django.http import HttpResponse, Http404
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login, authenticate
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.template.loader import render_to_string
from .tokens import account_activation_token
from django.contrib.auth import get_user_model
from django.core.mail import EmailMessage
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib import messages
from django.contrib.auth import update_session_auth_hash
from decimal import *
import datetime

User = get_user_model()

########################################
########Home Page Views####################
#########################################
def home_view(request):
    books = Inventory.objects.all()
    x = 0
    if request.user.is_authenticated:
        x = 1
        if request.user.is_staff:
            return redirect('/inventory')

    context = {
        'x': x,
        'books': books,
    }
    return render(request, "storefront/html/home.html", context)




########################################
########Admin Views####################
#########################################
def delete(request, bid):
    if not request.user.is_staff:
        raise Http404
    book = Inventory.objects.get(pk=bid)
    book.delete()
    return redirect('/inventory')

def InventoryView(request):
    if not request.user.is_staff:
        raise Http404
    booklist = Inventory.objects.all()
    context = {
        'booklist' : booklist
    }
    return render(request, 'storefront/html/inventory.html', context)

def InventoryaddView(request):
    if not request.user.is_staff:
        raise Http404
    if request.method == 'POST':
        form = InventoryForm(request.POST, request.FILES)

        if form.is_valid():
            form.save()
            return redirect('/home')
    else:
        form = InventoryForm()
    return render(request, 'storefront/html/inventory-add.html', {'form': form})

def edit_book(request, bid):
    if not request.user.is_staff:
        raise Http404

    book = Inventory.objects.get(pk=bid)
    if request.method == 'POST':
        form = BookEdit(request.POST, request.FILES, instance=book)

        if form.is_valid():
            bookform = form.save(commit=False)
            bookform.save()
            return redirect('/inventory')
    else:
        form = BookEdit(instance=book)
    return render(request, 'storefront/html/edit-book.html', {'form': form})



########################################
########Registration Views####################
#########################################
def activate(request, uidb64, token):
    try:
        uid = urlsafe_base64_decode(uidb64)
        user = User.objects.get(pk=uid)
    except(TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None
    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()
        login(request, user)
        # return redirect('home')
        return HttpResponse('Thank you for your email confirmation. Now you can login your account.')
    else:
        user.is_active = True
        user.save()
        return redirect('/activated')


def register(request):
    x = ""
    form = CustomerRegForm(request.POST or None)
    if request.method == 'POST':
        if form.is_valid():
            user = form.save(commit=False)
            user.is_active = False
            user.save()
            current_site = get_current_site(request)
            mail_subject = 'Activate your account.'
            message = render_to_string('acc_active_email.html', {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': account_activation_token.make_token(user),
            })
            to_email = form.cleaned_data.get('email')
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.send()
            return redirect("/register/registrationComplete")
        else:
            x = "Incorrect Input"

    context = {
        'form': form,
        'x': x
    }
    return render(request, "storefront/html/registration.html", context)


def activated(request):
    context = {}
    return render(request, "storefront/html/verificationComplete.html", context)


def customer_reg_complete_view(request):
    context = {}
    return render(request, "storefront/html/registrationComplete.html", context)

########################################
########Login/Logout Views####################
#########################################
def loggedout(request):
    context = {}
    return render(request, "storefront/html/loggedout.html", context)


########################################
########Password Views####################
#########################################

def changepassword(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)  # Important!
            messages.success(request, 'Your password was successfully updated!')
            return redirect('../home')
        else:
            messages.error(request, 'Please correct the error below.')
    else:
        form = PasswordChangeForm(request.user)
    return render(request, 'storefront/html/changepassword.html', {
        'form': form
    })


def forgot_view(request):
    x = 0
    form = CustomerLoginForm(request.POST or None)
    if form.is_valid():
        user = form.save(commit=False)
        for cust in Customers.objects.raw('SELECT * FROM bookstore.customers'):
            if (cust.email == user.email):
                cust.password = user.password
                cust.save()
                x=1

    context = {
        'form': form,
        'x': x
    }
    if (x):
        return redirect('/login')
    else:
        return render(request, "storefront/html/forgot.html", context)


########################################
########Profile Views####################
#########################################
def view_profile(request):
    x = 0
    if request.user.is_authenticated:
        x = 1
    context = {
        'x' : x,
        'user': request.user,
    }
    return render(request, "storefront/html/view_profile.html", context)

def edit_profile(request):
    x = 0
    if request.user.is_authenticated:
        x = 1
    if request.method == 'POST':
        form = CustomerEdit(request.POST, instance=request.user)
        if form.is_valid():
            user = form.save(commit=False)
            user.save()
            current_site = get_current_site(request)
            mail_subject = 'Profile Changed'
            message = render_to_string('profile_changed_email.html', {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': account_activation_token.make_token(user),
            })
            to_email = user.email
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.send()
            return redirect('../profile')
    else:
        form = CustomerEdit(instance=request.user)
    context = {
        'x': x,
        'form': form,
    }
    return render(request, "storefront/html/profile.html", context)

########################################
########Shopping Views####################
#########################################
def search(request):
    x = 0
    if request.user.is_authenticated:
        x = 1
    search_term = request.GET.get('search')
    if search_term:
        books = Inventory.objects.filter(title__icontains=search_term)
    else:
        books = Inventory.objects.all()

    context = {
        'x' : x,
        'books' : books
    }
    return render(request, "storefront/html/search.html", context)

def addtocart(request, bid):
    if not request.user.is_authenticated:
        return redirect('login')
    cartuser = request.user
    inv = Inventory.objects.get(pk=bid)

    try:
        cart = ShoppingCart.objects.get(custid=cartuser.id, invid=inv.bookid)
        if cart.quantity < inv.number_of_copies:
            cart.quantity += 1
    except:
        cart = ShoppingCart.objects.create(custid=cartuser.id, invid=inv.bookid, quantity = 1)

    cart.save()
    return redirect('mycart')

def removefromcart(request, bid):
    cartuser = request.user
    inv = Inventory.objects.get(pk=bid)

    cart = ShoppingCart.objects.get(custid=cartuser.id, invid=inv.bookid)
    cart.quantity -= 1
    if(cart.quantity == 0):
        cart.delete()
    else:
        cart.save()
    return redirect('mycart')

def cartview(request):
    x = 0
    if request.user.is_authenticated:
        x = 1
    else:
        return redirect('login')
    cartuser = request.user
    cartlist = ShoppingCart.objects.filter(custid = cartuser.id)
    total = Decimal(0.00)
    booklist = Inventory.objects.all()
    for cart in cartlist:
        for book in booklist:
            if cart.invid == book.bookid:
                total = (cart.quantity * book.sell_price) + total
                if cart.quantity > book.number_of_copies:
                    cart.quantity = book.number_of_copies
                    if cart.quantity == 0:
                        cart.delete()
                    cart.save()
                    return redirect('toomanybooks')

    context = {
        'x' : x,
        'total' : total,
        'cartlist' : cartlist,
        'booklist' : booklist
    }
    return render(request, "storefront/html/mycart.html", context)

def toomanybooks(request):
    return render(request, "storefront/html/toomanybooks.html")

def addpromo(request):
    try:
        order = Orders.objects.get(custid = request.user.id)
        order.ordertime = datetime.datetime.now()

    except:
        order = Orders.objects.create(custid = request.user.id, ordertime = datetime.datetime.now())

    form = orderForm(request.POST)
    if request.method == 'POST':
        if form.is_valid():
            orderform = form.save(commit=False)
            for promo in Promotions.objects.all():
                if promo.promocode == orderform.promotion:
                    order.promotion = orderform.promotion
                    order.save()
            return redirect('checkout')

    context = {
        'form' :form
    }
    return render(request, "storefront/html/addpromo.html", context)


def checkout(request):
    x = 0
    if request.user.is_authenticated:
        x = 1

    books = ""
    cartlist = ShoppingCart.objects.filter(custid=request.user.id)
    booklist = Inventory.objects.all()
    for cart in cartlist:
        for book in booklist:
            if cart.invid == book.bookid:
                books += book.title + "(x" + str(cart.quantity) + "), "

    #########################Getting the correct order object#################
    try:
        order = Orders.objects.get(custid = request.user.id)
        order.ordertime = datetime.datetime.now()

    except:
        order = Orders.objects.create(custid = request.user.id, ordertime = datetime.datetime.now())

    #################################getting the correct cart total##########################
    total = Decimal(0.00)
    cartlist = ShoppingCart.objects.filter(custid=request.user.id)
    booklist = Inventory.objects.all()
    for cart in cartlist:
        for book in booklist:
            if cart.invid == book.bookid:
                total = (cart.quantity * book.sell_price) + total

    ########################getting the promotion from the order
    promotion = Decimal(100)######set to 100 for the case it doesnt exist
    if order.promotion:
        for promo in Promotions.objects.all():
            if promo.promocode == order.promotion:
                promotion = Decimal(promo.percentage)


    total = total*(promotion/100)

    order.orderdate = datetime.date.today()
    order.orderstatus = "in progress"
    order.totalprice = total
    total = order.totalprice
    total = format(total, '.2f')
    order.save()

    form = Checkout(request.POST, instance=request.user)
    if request.method == 'POST':
        if form.is_valid():
            user = form.save(commit=False)
            user.save()
            current_site = get_current_site(request)
            mail_subject = 'Bookstore Order'
            message = render_to_string('order_email.html', {
                'cartlist': cartlist,
                'booklist': booklist,
                'user': user,
                'books': books,
                'order': order,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': account_activation_token.make_token(user),
            })
            to_email = user.email
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.send()
            return redirect('/checkout/order_confirm')
    else:
        form = Checkout(instance=request.user)
    context = {
        'total' : total,
        'x' : x,
        'form': form,
        'user': request.user
    }
    return render(request, "storefront/html/checkout.html", context)

def order_confirm(request):
    try:
        order = Orders.objects.get(custid = request.user.id)
        order.ordertime = datetime.datetime.now()

    except:
        raise Http404

    books = ""
    cartlist = ShoppingCart.objects.filter(custid=request.user.id)
    booklist = Inventory.objects.all()
    for cart in cartlist:
        for book in booklist:
            if cart.invid == book.bookid:
                books += book.title + "(x" + str(cart.quantity) + "), "
    order.books = books
    address = ""
    address += request.user.address + ", "
    address += request.user.city + ", "
    address += request.user.state + ", "
    address += request.user.zip_code + ", "

    order.shipaddress = address

    order.paymentmethod = request.user.card_type
    order.orderstatus = "order confirmed"
    order.custid += 5000
    order.save()
    for cart in cartlist:
        book = Inventory.objects.get(bookid=cart.invid)
        book.number_of_copies -= cart.quantity
        book.save()
        cart.delete()

    context = {
        'order' : order,
    }
    return render(request, "storefront/html/orderconfirm.html", context)


########################################
########Search Views####################
#########################################

def book(request, bid):
    x = 0
    if request.user.is_authenticated:
        x = 1
    book = Inventory.objects.get(pk=bid)
    context = {
        'x' : book,
        'book': book
    }
    return render(request, 'storefront/html/book.html', context)