from django.contrib import admin

from .models import Customers


class CustomersAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {'fields':['first_name','last_name']}),
    ]
# Register your models here.

admin.site.register(Customers)
