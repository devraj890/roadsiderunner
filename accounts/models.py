from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class Service(models.Model):
    sno = models.AutoField(primary_key=True)
    services = models.CharField(max_length=100)
    
    def __str__(self):
        return self.services


class UserProfile(models.Model):
    user = models.OneToOneField(User,on_delete= models.CASCADE)
    phone = models.CharField(max_length=25)
    gender = models.CharField(max_length=25)
    address = models.TextField()    
    city = models.CharField(max_length=50,blank=True, null=True)
    postal_code = models.CharField(max_length = 255,blank=True, null=True)
    profile_picture = models.ImageField(upload_to = 'photos/%Y/%m/%d', default="images/profile.png")
    

    user_type = (
            ('as_a','AS A'),
            ('user','USER'),
            ('mechanic','MECHANIC'),
            ('fual_station', 'FUAL STATION')
        )
    user_type = models.CharField(max_length=15,choices = user_type,default = 'as_a')

    def __str__(self):
        return self.user.username
    
    
class ServiceProvider(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    userprofile = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    
    name = models.CharField(max_length=100)
    description = models.TextField()
    phone = models.CharField(max_length=13)
    lat = models.CharField(max_length=100)
    lang = models.CharField(max_length=100)
    
    service_type = (
            ('as_a','AS A'),
            ('mechanic','MECHANIC'),
            ('fual_station', 'FUAL STATION')
        )
    
    service_type = models.CharField(max_length=15, choices = service_type, default= 'as_a')
        
    service_name = models.TextField()
    address = models.TextField()
    pincode = models.IntegerField()
    profile = models.ImageField(upload_to="photos/services")
    
    def __str__(self):
        return self.name


class Booking(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    userprofile = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    lat = models.CharField(max_length=100)
    lang = models.CharField(max_length=100)
    service_type = (
            ('as_a','AS A'),
            ('mechanic','MECHANIC'),
            ('fual_station', 'FUAL STATION')
        )
    service_type = models.CharField(max_length=15, choices = service_type, default= 'as_a')
    service_name = models.CharField(max_length=100)
    name = models.CharField(max_length=50)
    phone = models.CharField(max_length=13)
    email = models.CharField(max_length=50)
    vehicle_name = models.CharField(max_length=50)
    vehicle_model = models.CharField(max_length=50)
    vehicle_image = models.ImageField(upload_to="photos/Booking")
    note = models.TextField()
    
    sprovider = models.ForeignKey(ServiceProvider,default=1, on_delete=models.SET_DEFAULT)
    
    status_choice = (
        ('pending', 'PENDING'),
        ('Approved', 'APPROVED'),
        ('reject', 'REJECT'),
        ('Deliver_fuel', 'DELIVER FUEL'),
        ('Completed_service', 'COMPLETED SERVICE'),
        
    )
    status = models.CharField(max_length=50, choices = status_choice, default='pending')

    def __str__(self):
        return self.name+ " - " + self.service_type+ " - " + self.service_name


