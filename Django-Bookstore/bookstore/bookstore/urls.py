"""bookstore URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.conf.urls import include
from django.contrib.auth import views as auth_views

from storefront.views import *



urlpatterns = [

    path('inventory', InventoryView),
    path('inventory/add', InventoryaddView),
    path('delete/<slug:bid>/', delete, name='delete'),

    path('login/', auth_views.LoginView.as_view(template_name='storefront/html/login.html')),
    path('logout/', auth_views.LogoutView.as_view(template_name='storefront/html/loggedout.html')),
    path('loggedout/', loggedout),
    path('login/forgot', forgot_view),

    path('password_reset/',
         auth_views.PasswordResetView.as_view(template_name='storefront/html/password_reset_form.html'),
         name='password_reset'),
    path('password_reset/done/',
         auth_views.PasswordResetDoneView.as_view(template_name='storefront/html/password_reset_done.html'),
         name='password_reset_done'),
    path('reset/<slug:uidb64>/<slug:token>/',
         auth_views.PasswordResetConfirmView.as_view(template_name='storefront/html/password_reset_confirm.html'),
         name='password_reset_confirm'),
    path('reset/done/',
         auth_views.PasswordResetCompleteView.as_view(template_name='storefront/html/password_reset_complete.html'),
         name='password_reset_complete'),

    path('register/', register),
    path('register/registrationComplete', customer_reg_complete_view),
    path('activate/<slug:uidb64>/<slug:token>/', activate, name='activate'),
    path('activated/', activated),

    path('profile/', view_profile, name='view_profile'),
    path('profile/edit', edit_profile, name='edit_profile'),
    path('profile/changepassword', changepassword, name='changepassword'),

    path('addtocart/<slug:bid>/', addtocart, name='addtocart'),
    path('removefromcart/<slug:bid>/', removefromcart, name='removefromcart'),
    path('checkout/', checkout, name='checkout'),
    path('mycart/', cartview, name='mycart'),
    path('checkout/order_confirm/', order_confirm, name='order_confirm'),

    path('login/forgot', forgot_view),

    path('home/', home_view),
    path('', home_view),

    path('admin/', admin.site.urls),
    # path('loggedin/', loggedin_view),


    path('book/<slug:bid>/', book, name='book'),
    path('search/', search, name='search'),
]
urlpatterns += staticfiles_urlpatterns()
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)