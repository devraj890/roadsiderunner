from django.shortcuts import render,redirect, HttpResponse
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from accounts.models import UserProfile, Service, Booking, ServiceProvider
from django.contrib import messages
from django.contrib.auth.decorators import login_required

# Create your views here.

# def clean_email(self,username, email):
# 	username = self.cleaned_data["username"]
# 	email = self.cleaned_data["email"]
#      = User.objects.filter(email__iexact=email).exclude(username__iexact=username)
#     if users:
# 	    raise forms.ValidationError(("A user with that email already exists."))
# 	    return email.lower()


def register(request):
    if request.method == "POST":
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        email = request.POST.get('email')
        phone = request.POST.get('phone')
        gender = request.POST.get('gender')
        address = request.POST.get('address')
        username = request.POST.get('username')
        role = request.POST.get('role')
        password1 = request.POST.get('password1')
        password2 = request.POST.get('password2')
        
        if password1 != password2:
            messages.add_message(request, messages.ERROR, "Password was not match !")
            return redirect('register')
        
        use = User.objects.filter(email__iexact=email).exclude(username__iexact=username)
        if use:
            messages.add_message(request, messages.ERROR, "A user with that email already exists.")
        
        myuser = User.objects.create_user(username, email, password1)
        myuser.first_name = first_name
        myuser.last_name = last_name
        myuser.save()
        
        userprofile = UserProfile(user=User.objects.filter(username=username).first(), phone=phone, gender=gender, address=address, user_type=role)
        userprofile.save()
        messages.add_message(request, messages.SUCCESS, "The Registration was Successfully")
        return redirect('login')
        
    return render(request, "accounts/signup.html")

def login_view(request):
    if request.method == "POST":
        user_role = request.POST.get('role')
        username = request.POST.get('username')
        password = request.POST.get('password')
        
        if UserProfile.objects.filter(user_type=user_role).exists():
            role = UserProfile.objects.get(user_type=user_role)
            if role.user_type == "user":
                user = authenticate(request, username=username, password=password)
                if user is not None:
                    login(request, user)
                    messages.add_message(request, messages.SUCCESS, "Successfully Login by User")
                    return redirect('home')
                else:
                    messages.add_message(request, messages.ERROR, "email and password are not match.")  
                    return redirect('login')
            
            elif role.user_type == 'mechanic':
                user = authenticate(request, username=username, password=password)
                if user is not None:
                    login(request, user)
                    messages.add_message(request, messages.SUCCESS, "Successfully Login by Mechanic")
                    return redirect('home')
                else:
                    messages.add_message(request, messages.ERROR, "email and password are not match.")
                    return redirect('login') 
                
            elif role.user_type == 'fual_station':
                user = authenticate(request, username=username, password=password)
                if user is not None:
                    login(request, user)
                    messages.add_message(request, messages.SUCCESS, "Successfully Login by Fual Station")
                    return redirect('home')
                else:
                    messages.add_message(request, messages.ERROR, "email and password are not match.")
                    return redirect('login')
    
            else:
                messages.add_message(request, messages.ERROR, "The user are not exist.")   
                return redirect('login')
        else:
            messages.add_message(request, messages.ERROR, "The user role are not exist.")   
            return redirect('login')
    return render(request, "accounts/login.html")

def logout_view(request):
    logout(request)
    return redirect('home')

@login_required(login_url="/accounts/login")
def userprofile(request):
    current_user = request.user.id
    # print(current_user)
    user_data = User.objects.filter(id=current_user).first()
    userprofile_data = UserProfile.objects.filter(user_id=current_user).first()
    
    # print(user_data)
    context = {
        'user_data':user_data,
        'userprofile_data':userprofile_data,
    }
    return render(request, "accounts/userprofile.html", context)


def update_profile(request):
    current_user = request.user.id
    # print(current_user)
    user_data = User.objects.filter(id=current_user).first()
    userprofile_data = UserProfile.objects.filter(user_id=current_user).first()
    
    # print(user_data)
    context = {
        'user_data':user_data,
        'userprofile_data':userprofile_data,
    }
    
    if request.method == "POST":
        current_user = request.user.id
        profile = request.FILES.get('profile')
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        phone = request.POST['phone']
        email = request.POST['email']
        username = request.POST['username']
        address = request.POST['address']
        city = request.POST['city']
        pincode = request.POST['pcode']
    
        # current_profile = request.POST['current_profile']
        user_profile = UserProfile.objects.get(user_id=request.user)
        user_profile.profile_picture=profile
        user_profile.save()

        User.objects.filter(id=current_user).update(username=username, email=email, first_name=first_name, last_name=last_name)
        
        UserProfile.objects.filter(user_id=current_user).update(phone=phone, address=address, city=city, postal_code=pincode)
        
        messages.add_message(request, messages.SUCCESS, "Your Profile are Update Successfully")
        return redirect('userprofile')

    return render(request, "accounts/update_profile.html", context)
    


@login_required(login_url="/accounts/login")
def booking(request,id):
    service = Service.objects.all()
    userprofile = UserProfile.objects.all()
    serviceprovider = ServiceProvider.objects.filter(id=id).first()
    context = {
        'service': service, 
        'userprofile': userprofile,
        'serviceprovider':serviceprovider
        }
    
    if request.method == "POST":
        user = request.user.id
        userprofile = request.POST['userprofile_id']
        
        lat = request.POST.get('lat')
        lang = request.POST.get('lang')
        
        sprovider = request.POST['sprovider']
        name = request.POST.get('name')
        phone = request.POST.get('phone')
        email = request.POST.get('email')

        service_type = request.POST.get('service_group')
        service_name = request.POST.get('service_name')
        
        vehicle_name = request.POST.get('vehicle_name')
        vehicle_model = request.POST.get('vehicle_model')
        vehicle_image = request.FILES.get('vehicle_image')
        
        note = request.POST.get('note')
        
        booking = Booking(user_id=user, userprofile_id=userprofile, name=name, note=note, phone=phone, email=email, lat=lat, lang=lang, service_type=service_type, service_name=service_name,  vehicle_image=vehicle_image,vehicle_name=vehicle_name, vehicle_model=vehicle_model, sprovider_id=sprovider)
        
        booking.save()
        messages.add_message(request,messages.SUCCESS, "Your Service Booking Details are sent Succefully, pleace Wait for approve..... and do feedback")
        return redirect('home')

    return render(request, "accounts/booking.html", context)


@login_required(login_url="/accounts/login")
def servicerequest(request):
    # userprofile = UserProfile.objects.all()
    # if userprofile.user_type == 'user':
    current_user = request.user.id
    booking_details = Booking.objects.filter(user_id=current_user)
    
    
    user_location = Booking.objects.all()
    for user_location in user_location:
        user_location_url = "https://www.google.com/maps/search/?api=1&query="+user_location.lat+","+user_location.lang
    # if userprofile.user_type == 'mechanic':
    booking_mechanic = Booking.objects.filter(service_type = 'mechanic')
        
    # if userprofile.user_type == 'fual_station':
    booking_fuelstation = Booking.objects.filter(service_type = 'fual_station')
    
   
    context = {
        'booking_details':booking_details,
        'booking_mechanic':booking_mechanic,
        'booking_fuelstation':booking_fuelstation,
        'user_location_url':user_location_url
    }
    
    
    if request.method == "POST":
        # user = request.POST['user']
        # userprofile = request.POST['userprofile']
        status = request.POST['status']
        booking_id = request.POST['booking_id']
        # booking = Booking.objects.get(id=booking_id)
        try:
            booking = Booking.objects.filter(id=booking_id).update(status=status)
            booking.save()
            messages.add_message(request, messages.SUCCESS, "Request Are "+ status +" Now")
            return redirect('servicerequest')
        except Exception as e:
            return redirect('servicerequest')
        # booking_status = Booking(status=status,user_id=user, userprofile_id=userprofile)
    return render(request, "accounts/request.html", context)
