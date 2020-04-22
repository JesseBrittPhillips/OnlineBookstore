from django.shortcuts import render, redirect
from .models import Customers
from .forms import CustomerRegForm, CustomerLoginForm, CustomerEdit
from django.http import HttpResponse
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

User = get_user_model()

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
        return redirect('/reset/done')

def register(request):
    x = ""
    form = CustomerRegForm(request.POST)
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

# Create your views here.
def customer_reg_view(request):
    form = CustomerRegForm(request.POST or None)
    if form.is_valid():
        user = form.save(commit=False)

    context = {
        'form': form
    }
    return render(request, "storefront/html/registration.html", context)

def customer_reg_complete_view(request):
    context = {}
    return render(request, "storefront/html/registrationComplete.html", context)

def customer_login_view(request):
    x = 0
    y = ""
    form = CustomerLoginForm(request.POST or None)
    if form.is_valid():
        user = form.save(commit=False)
        for cust in Customers.objects.raw('SELECT * FROM bookstore.customers'):
            if(cust.email == user.email):
                if(cust.password == user.password):
                    y=""
                    x=1
                else:
                    y="please enter the correct email/password"
            else:
                y = "please enter the correct email/password"
    context = {
        'form': form,
        'x':x,
        'y':y,
    }
    if(x):
        return redirect('/loggedin')
    else:
        return render(request, "storefront/html/login.html", context)

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

def home_view(request):
    x = 0
    if request.user.is_authenticated:
        x=1

    context = {'x':x}
    return render(request, "storefront/html/home.html", context)

def loggedin_view(request):
    context = {}
    return render(request, "storefront/html/loggedin.html", context)

def view_profile(request):
    context = {
        'user': request.user
    }
    return render(request, "storefront/html/view_profile.html")

def edit_profile(request):
    if request.method == 'POST':
        form = CustomerEdit(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            return redirect('../profile')
    else:
        form = CustomerEdit(instance=request.user)
    context = {
        'form': form
    }
    return render(request, "storefront/html/profile.html", context)

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