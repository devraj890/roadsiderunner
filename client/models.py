from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class Contact(models.Model):
    cid = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    phone = models.CharField(max_length=13)
    email = models.EmailField(max_length=50)
    subject = models.CharField(max_length=50)
    message = models.TextField()
    
    def __str__(self):
        return self.name

class Feedback(models.Model):
    sno = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    message = models.TextField()
    rating = models.IntegerField()
    
    def __str__(self):
        return self.name
