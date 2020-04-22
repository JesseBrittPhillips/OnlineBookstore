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
from django.conf.urls import include
from django.contrib.auth import views as auth_views
from django.contrib.auth.views import (
    PasswordResetView, PasswordResetDoneView, PasswordResetConfirmView, PasswordResetCompleteView
)

from storefront.views import (
    customer_reg_view, customer_reg_complete_view, customer_login_view, forgot_view,
    home_view, loggedin_view, register, activate, view_profile, edit_profile, changepassword
)



urlpatterns = [
    path('login/', auth_views.LoginView.as_view(template_name='storefront/html/login.html')),
    path('logout/', auth_views.LogoutView.as_view(template_name='storefront/html/home.html')),
    path('register/', register),
    path('register/registrationComplete', customer_reg_complete_view),
    path('activate/<uidb64>/<token>/', activate, name='activate'),
    path('profile/', view_profile, name='view_profile'),
    path('profile/edit', edit_profile, name='edit_profile'),
    path('profile/changepassword', changepassword, name='changepassword'),
    path('login/forgot', forgot_view),
    path('home/', home_view),
    path('admin/', admin.site.urls),
    path('loggedin/', loggedin_view),
    # path('password_reset/', PasswordResetView.as_view(), name='password_reset'),
    # path('password_reset/done/', PasswordResetDoneView.as_view(), name='password_reset_done'),
    path('reset/<uidb64>/<token>/', PasswordResetConfirmView.as_view(), name='password_reset_confirm'),
    path('reset/done/', PasswordResetCompleteView.as_view(), name='password_reset_complete'),
    path('', home_view),

    path('password_reset/', auth_views.PasswordResetView.as_view(), name='password_reset'),
    path('password_reset/done/', auth_views.PasswordResetDoneView.as_view(), name='password_reset_done'),
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(), name='password_reset_confirm'),
    path('reset/done/', auth_views.PasswordResetCompleteView.as_view(), name='password_reset_complete'),

]
