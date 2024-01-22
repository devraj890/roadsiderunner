from django.urls import path
from client import views

urlpatterns = [
    path('', views.home, name="home"),
    path('about/', views.about, name="about"),
    path('service/', views.service, name="service"),
    path('breakdown/', views.breakdown, name="breakdown"),
    path('location/', views.location, name="location"),
    path('contact', views.contact, name="contact"),
    path('fual/', views.fual, name="fual"),
    path('feedback', views.feedback, name="feedback")
]