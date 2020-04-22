from django import forms

from .models import Customers
from django.contrib.auth import get_user_model
from django.contrib.auth.forms import UserCreationForm, PasswordChangeForm, UserChangeForm

User = get_user_model()


class CheckEmailForm(forms.ModelForm):
    class Meta:
        model = Customers
        fields = ['username']


class CustomerRegForm(UserCreationForm):
    email = forms.EmailField(label='Email address', max_length=75)
    phone = forms.CharField(label='Phone Number', max_length=75)
    address = forms.CharField(label='Address', max_length=75, required=False)
    state = forms.CharField(label='State', max_length=75, required=False)
    city = forms.CharField(label='City', max_length=75, required=False)
    zip_code = forms.CharField(label='Zip Code', max_length=75, required=False)
    card_type = forms.CharField(label='Card Type', max_length=75, required=False)
    card_number = forms.CharField(label='Card Number', max_length=75, required=False)
    expirationdate = forms.DateField(label='Expiration Date', required=False)
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
            'expirationdate',
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
        user.expirationdate = self.cleaned_data['expirationdate']

        if commit:
            user.save()

        return user



class CustomerEdit(UserChangeForm):
    phone = forms.CharField(label='Phone Number', max_length=75)
    address = forms.CharField(label='Address', max_length=75, required=False)
    state = forms.CharField(label='State', max_length=75, required=False)
    city = forms.CharField(label='City', max_length=75, required=False)
    zip_code = forms.CharField(label='Zip Code', max_length=75, required=False)
    card_type = forms.CharField(label='Card Type', max_length=75, required=False)
    card_number = forms.CharField(label='Card Number', max_length=75, required=False)
    promotions = forms.BooleanField(label='promotions', required=False)
    expirationdate = forms.DateField(label='Expiration Date', required=False)

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
            'expirationdate',
            'promotions'
        )
        exclude = (
            'email',
            'username'
        )

    # def save(self, commit=True):
    #     user = super(CustomerRegForm, self).save(commit=False)
    #     user.first_name = self.cleaned_data['first_name']
    #     user.last_name = self.cleaned_data['last_name']
    #     user.email = self.cleaned_data['email']
    #     user.phone = self.cleaned_data['phone']
    #     user.address = self.cleaned_data['address']
    #     user.state = self.cleaned_data['state']
    #     user.zip_code = self.cleaned_data['zip_code']
    #     user.city = self.cleaned_data['city']
    #     user.email = self.cleaned_data['card_type']
    #     user.card_type = self.cleaned_data['card_type']
    #     user.card_number = self.cleaned_data['card_number']
    #     user.expirationdate = self.cleaned_data['expirationdate']
    #
    #     if commit:
    #         user.save()
    #
    #     return user


class CustomerLoginForm(forms.ModelForm):
    class Meta:
        email = forms.CharField()
        password = forms.CharField(widget=forms.PasswordInput())

        model = Customers
        fields = ['email', 'password']
        widgets = {'password': forms.PasswordInput(), }
