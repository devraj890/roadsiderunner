from django.contrib import admin
from django.contrib.admin.sites import site
from accounts.models import UserProfile, Service, ServiceProvider, Booking
from django.contrib.auth.models import Group
# Register your models here.
admin.site.unregister(Group)

@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('user', 'phone', 'gender', 'address','city', 'user_type','profile_picture')
# admin.site.register(UserProfile)
    
@admin.register(ServiceProvider)
class ServiceProviderAdmin(admin.ModelAdmin):
    list_display = ('user', 'userprofile', 'name', 'phone', 'service_type', 'service_name', 'lat', 'lang', 'profile')
# admin.site.register(ServiceProvider)


@admin.register(Booking)
class BookingAdmin(admin.ModelAdmin):
    list_display = ('user', 'name', 'phone', 'vehicle_name', 'service_type', 'sprovider', 'lat', 'lang', 'status')

# admin.site.register(Booking)

admin.site.register(Service)
# admin.site.register(Feedback)

admin.site.site_title = "RoadSide-Runner"
admin.site.site_header = "RoadSide-Runner"
admin.site.index_title = "RoadSide-Runner"