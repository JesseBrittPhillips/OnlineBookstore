from django import forms

from .models import *
from django.contrib.auth import get_user_model
from django.contrib.auth.forms import UserCreationForm, PasswordChangeForm, UserChangeForm
from django.core.validators import MaxValueValidator

User = get_user_model()



class orderForm(forms.ModelForm):
    class Meta:
        model = Orders
        fields = (
            'promotion',
        )
        exclude = (
            'ordertime',
        )


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
    zip_code = forms.IntegerField(label='Zip Code', validators=[MaxValueValidator(99999)], required=False)
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

