from django import forms

from .models import *
from django.contrib.auth import get_user_model
from django.contrib.auth.forms import UserCreationForm, PasswordChangeForm, UserChangeForm
from django.core.validators import MaxValueValidator

User = get_user_model()


class InventoryForm(forms.ModelForm):
    
    class Meta:
        model = Inventory
        fields = (
            'bookid',
            'title',
            'authors',
            'buyprice',
            'sell_price',
            'minumum',
            'category',
            'number_of_copies',
            'publisher',
            'editor',
            'isbn',
            'datepublished',
            'pic'
        )

    def save(self, commit=True):
        book = super(InventoryForm, self).save(commit=False)
        book.title = self.cleaned_data['title']
        book.authors = self.cleaned_data['authors']
        book.buyprice = self.cleaned_data['buyprice']
        book.sell_price = self.cleaned_data['sell_price']
        book.minumum = self.cleaned_data['minumum']
        book.category = self.cleaned_data['category']
        book.number_of_copies = self.cleaned_data['number_of_copies']
        book.publisher = self.cleaned_data['publisher']
        book.editor = self.cleaned_data['editor']
        book.isbn = self.cleaned_data['isbn']
        book.datepublished = self.cleaned_data['datepublished']
        book.pic = self.cleaned_data['pic']

        if commit:
            book.save()

        return book

class CheckEmailForm(forms.ModelForm):
    class Meta:
        model = Customers
        fields = ['email']


class CustomerRegForm(UserCreationForm):
    email = forms.EmailField(label='Email address', max_length=75)
    phone = forms.CharField(label='Phone Number', max_length=75)
    address = forms.CharField(label='Address', max_length=75, required=False)
    state = forms.CharField(label='State', max_length=75, required=False)
    city = forms.CharField(label='City', max_length=75, required=False)
    zip_code = forms.IntegerField(label='Zip Code', validators=[MaxValueValidator(99999)], required=False)
    card_type = forms.CharField(label='Card Type', max_length=75, required=False)
    card_number = forms.CharField(label='Card Number', max_length=75, required=False)
    expiration_date = forms.DateField(label='Expiration Date', required=False)
    promotions = forms.BooleanField(label='promotions', required=False)

    class Meta:
        model = User
        fields = (
            'username',
            'first_name',
            'last_name',
            'email',
            'phone',
            'address',
            'state',
            'city',
            'zip_code',
            'card_type',
            'card_number',
            'expiration_date',
            'password1',
            'password2',
            'promotions'
        )
        password = forms.CharField(widget=forms.PasswordInput())
        widgets = {'password': forms.PasswordInput(), }

    def save(self, commit=True):
        user = super(CustomerRegForm, self).save(commit=False)
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']
        user.email = self.cleaned_data['email']
        user.phone = self.cleaned_data['phone']
        user.address = self.cleaned_data['address']
        user.state = self.cleaned_data['state']
        user.zip_code = self.cleaned_data['zip_code']
        user.city = self.cleaned_data['city']
        user.card_number = self.cleaned_data['card_number']
        user.card_type = self.cleaned_data['card_type']
        user.expiration_date = self.cleaned_data['expiration_date']

        if commit:
            user.save()

        return user

class CustomerEdit(UserChangeForm):
    phone = forms.CharField(label='Phone Number', max_length=75)
    address = forms.CharField(label='Address', max_length=75, required=False)
    state = forms.CharField(label='State', max_length=75, required=False)
    city = forms.CharField(label='City', max_length=75, required=False)
    zip_code = forms.IntegerField(label='Zip Code', validators=[MaxValueValidator(99999)], required = False)
    card_type = forms.CharField(label='Card Type', max_length=75, required=False)
    card_number = forms.CharField(label='Card Number', max_length=75, required=False)
    promotions = forms.BooleanField(label='promotions', required=False)
    expiration_date = forms.DateField(label='Expiration Date', required=False)

    class Meta:
        model = User
        fields = (
            'first_name',
            'last_name',
            'phone',
            'address',
            'state',
            'city',
            'zip_code',
            'card_type',
            'card_number',
            'expiration_date',
            'promotions'
        )
        exclude = (
            'email',
            'username'
        )


class CustomerLoginForm(forms.ModelForm):
    class Meta:
        email = forms.CharField()
        password = forms.CharField(widget=forms.PasswordInput())

        model = Customers
        fields = ['email', 'password']
        widgets = {'password': forms.PasswordInput(), }


class Checkout(UserChangeForm):
    address = forms.CharField(label='Address', max_length=75)
    state = forms.CharField(label='State', max_length=75)
    city = forms.CharField(label='City', max_length=75)
    zip_code = forms.IntegerField(label='Zip Code', validators=[MaxValueValidator(99999)])
    card_type = forms.CharField(label='Card Type')
    card_number = forms.CharField(label='Card Number')
    expiration_date = forms.DateField(label='Expiration Date')

    class Meta:
        model = User
        fields = (
            'address',
            'state',
            'city',
            'zip_code',
            'card_type',
            'card_number',
            'expiration_date',
        )
        exclude = (
            'email',
            'username',
            'first_name',
            'last_name',
            'phone'
        )

class BookEdit(forms.ModelForm):
    bookid = models.AutoField(primary_key=True)
    title = models.CharField(max_length=45, blank=True, null=True)
    authors = models.CharField(max_length=45, blank=True, null=True)
    buyprice = models.DecimalField(db_column='BuyPrice', max_digits=6, decimal_places=2, blank=True, null=True)  # Field name made lowercase.
    sell_price = models.DecimalField(db_column='Sell Price', max_digits=6, decimal_places=2, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    minumum = models.IntegerField(blank=True, null=True)
    category = models.CharField(max_length=45, blank=True, null=True)
    number_of_copies = models.IntegerField(db_column='number of copies', blank=True, null=True)  # Field renamed to remove unsuitable characters.
    publisher = models.CharField(max_length=45, blank=True, null=True)
    editor = models.CharField(max_length=45, blank=True, null=True)
    isbn = models.CharField(db_column='ISBN', max_length=45, blank=True, null=True)  # Field name made lowercase.
    datepublished = models.TextField(blank=True, null=True)  # This field type is a guess.
    pic = models.ImageField(upload_to='images/', blank=True)


    class Meta:
        model = Inventory
        fields = (
            'bookid',
            'title',
            'authors',
            'buyprice',
            'sell_price',
            'minumum',
            'category',
            'number_of_copies',
            'publisher',
            'editor',
            'isbn',
            'datepublished',
            'pic'
        )