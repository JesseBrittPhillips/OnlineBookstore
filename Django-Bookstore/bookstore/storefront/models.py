from django.db import models
from encrypted_model_fields.fields import EncryptedCharField
from django.contrib.auth.models import AbstractBaseUser
from django.contrib.auth.models import UserManager
from django.contrib.auth.models import PermissionsMixin

# Create your models here.
class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    phone = models.CharField(db_column='phone_number', max_length=45, blank=True, null=False)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
    address = models.CharField(db_column='address', max_length=45, blank=True, null=True)  # Field name made lowercase.
    city = models.CharField(db_column='city', max_length=45, blank=True, null=True)  # Field name made lowercase.
    state = models.CharField(db_column='State', max_length=45, blank=True, null=True)  # Field name made lowercase.
    zip_code = models.CharField(db_column='zipcode', max_length=45, blank=True, null=True)  # Field name made lowercase.
    promotions = models.IntegerField(blank=True, null=True)
    cart_id = models.ForeignKey('ShoppingCart', models.DO_NOTHING, db_column='cart_id', blank=True, null=True)  # Field name made lowercase.
    card_type = models.CharField(db_column='card_type', max_length=45, blank=True, null=True)  # Field name made lowercase.
    card_number = EncryptedCharField(max_length=100)  # Field name made lowercase.
    expiration_date = models.DateField(db_column='expiration_date', blank=True, null=True)  # Field name made lowercase.
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    username = models.CharField(unique=True, max_length=150)
    email = models.CharField(max_length=45)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Coverpictures(models.Model):
    picid = models.AutoField(db_column='PicID', primary_key=True)  # Field name made lowercase.
    picture = models.CharField(db_column='Picture', max_length=45, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'coverpictures'

class ExtraManager(models.Model):
    objects = UserManager()

    class Meta:
        abstract = True

class Customers(AbstractBaseUser, ExtraManager):
    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ('email', 'password')
    phone = models.CharField(db_column='phone_number', max_length=45, blank=True, null=False)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
    address = models.CharField(db_column='address', max_length=45, blank=True, null=True)  # Field name made lowercase.
    city = models.CharField(db_column='city', max_length=45, blank=True, null=True)  # Field name made lowercase.
    state = models.CharField(db_column='State', max_length=45, blank=True, null=True)  # Field name made lowercase.
    zip_code = models.CharField(db_column='zipcode', max_length=45, blank=True, null=True)  # Field name made lowercase.
    promotions = models.IntegerField(blank=True, null=True)
    cart_id = models.ForeignKey('ShoppingCart', models.DO_NOTHING, db_column='cart_id', blank=True, null=True)  # Field name made lowercase.
    card_type = models.CharField(db_column='card_type', max_length=45, blank=True, null=True)  # Field name made lowercase.
    card_number = EncryptedCharField(max_length=100)  # Field name made lowercase.
    expiration_date = models.DateField(db_column='expiration_date', blank=True, null=True)  # Field name made lowercase.
    password = models.CharField(max_length=128)
    username = models.CharField(unique=True, max_length=150)
    email = models.CharField(max_length=45)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField(default=0)

    def get_full_name(self):
        pass

    def get_short_name(self):
        pass

    @property
    def is_superuser(self):
        return self.is_staff

    def has_perm(self, perm, obj=None):
        return self.is_staff

    def has_module_perms(self, app_label):
        return self.is_staff


    class Meta:
        managed = False
        db_table = 'customers'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Inventory(models.Model):
    bookid = models.AutoField(primary_key=True)
    title = models.CharField(max_length=45, blank=True, null=True)
    authors = models.CharField(max_length=45, blank=True, null=True)
    coverpicid = models.ForeignKey(Coverpictures, models.DO_NOTHING, db_column='coverPicID', blank=True, null=True)  # Field name made lowercase.
    buyprice = models.DecimalField(db_column='BuyPrice', max_digits=6, decimal_places=2, blank=True, null=True)  # Field name made lowercase.
    sell_price = models.DecimalField(db_column='Sell Price', max_digits=6, decimal_places=2, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    minumum = models.IntegerField(blank=True, null=True)
    category = models.CharField(max_length=45, blank=True, null=True)
    number_of_copies = models.IntegerField(db_column='number of copies', blank=True, null=True)  # Field renamed to remove unsuitable characters.
    publisher = models.CharField(max_length=45, blank=True, null=True)
    editor = models.CharField(max_length=45, blank=True, null=True)
    isbn = models.CharField(db_column='ISBN', max_length=45, blank=True, null=True)  # Field name made lowercase.
    datepublished = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'inventory'


class Orders(models.Model):
    orderid = models.AutoField(db_column='OrderID', primary_key=True)  # Field name made lowercase.
    custid = models.ForeignKey(Customers, models.DO_NOTHING, db_column='CustID', blank=True, null=True)  # Field name made lowercase.
    ordertime = models.TimeField()
    orderdate = models.DateField(db_column='OrderDate', blank=True, null=True)  # Field name made lowercase.
    orderstatus = models.CharField(db_column='OrderStatus', max_length=45, blank=True, null=True)  # Field name made lowercase.
    totalprice = models.DecimalField(db_column='TotalPrice', max_digits=10, decimal_places=2, blank=True, null=True)  # Field name made lowercase.
    shipaddress = models.CharField(db_column='ShipAddress', max_length=45, blank=True, null=True)  # Field name made lowercase.
    paymentmethod = models.CharField(db_column='PaymentMethod', max_length=45, blank=True, null=True)  # Field name made lowercase.
    books = models.CharField(db_column='Books', max_length=45, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'orders'




class PaymentInfo(models.Model):
    paymentid = models.AutoField(db_column='PaymentID', primary_key=True)  # Field name made lowercase.
    card_number = models.CharField(db_column='Card number', max_length=45, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'payment info'


class Promotions(models.Model):
    promoid = models.AutoField(db_column='PromoID', primary_key=True)  # Field name made lowercase.
    promocode = models.CharField(db_column='PromoCode', max_length=10, blank=True, null=True)  # Field name made lowercase.
    percentage = models.IntegerField(db_column='Percentage', blank=True, null=True)  # Field name made lowercase.
    start_date = models.DateField(db_column='Start Date', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    expiration_date = models.DateField(db_column='Expiration Date', blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'promotions'


class ShoppingCart(models.Model):
    cartid = models.AutoField(db_column='cartID', primary_key=True)  # Field name made lowercase.
    custid = models.IntegerField(db_column='CustID', blank=True, null=True)  # Field name made lowercase.
    books = models.CharField(db_column='Books', max_length=45, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'shopping cart'
