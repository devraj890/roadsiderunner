from django.urls import path
from accounts import views

urlpatterns = [
    path('register',views.register,name='register'),
    path('login',views.login_view,name="login"),
    path('logout', views.logout_view, name="logout"),
    path('userprofile', views.userprofile, name="userprofile"),
    path('update_profile', views.update_profile, name="update_profile"),
    path('booking/<int:id>', views.booking, name="booking"),
    path('servicerequest', views.servicerequest, name="servicerequest"),
]