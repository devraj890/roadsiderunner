from django.shortcuts import render, HttpResponse, redirect
from client.models import Contact, Feedback
from django.contrib import messages
# import accounts.views
from django.contrib.auth.decorators import login_required
from accounts.models import Service, UserProfile, ServiceProvider
from math import radians, sin, cos, sqrt, atan2

# Create your views here.
def home(request):
    feed = Feedback.objects.all()
    n = len(feed)
    context = {
        'feed':feed,
        'range':range(1,n),
    }
    return render(request, "client/index.html", context)

def about(request):
    return render(request,"client/about.html")

def service(request):
    service = Service.objects.all()
    userprofile = UserProfile.objects.all()
    
    context = {
        'service': service, 
        'userprofile': userprofile
        }
    
    if request.method == "POST":
        user = request.user.id
        userprofile = request.POST['userprofile_id']
        
        lat = request.POST.get('lat')
        lang = request.POST.get('lang')
        
        
        name = request.POST.get('name')
        phone = request.POST.get('phone')
        address = request.POST.get('address')
        pincode = request.POST.get('pcode')
        profile = request.FILES.get('profile')
        
        service_type = request.POST.get('service_group')
        service_name = request.POST.getlist('service_name')
        
        description = request.POST.get('description')
        
        detailservice = ServiceProvider(user_id=user, userprofile_id=userprofile, name=name, description=description, phone=phone, lat=lat, lang=lang, service_type=service_type, service_name=service_name, address=address, pincode=pincode, profile=profile)
        
        detailservice.save()
        messages.add_message(request,messages.SUCCESS, "Your Service Details are succefully save...")
        return redirect('home')
        
    return render(request,"client/service.html", context)

def contact(request):
    if request.method == "POST":
        name = request.POST.get('name')
        phone = request.POST.get('phone')
        email = request.POST.get('email')
        subject = request.POST.get('esubject')
        message = request.POST.get('message')
        
        if len(name)<2 or len(email)<3 or len(phone)<10 or len(message)<4:
            messages.add_message(request,messages.ERROR, "Please fill the form correctly")
            return redirect("home")
        else:
            contact = Contact(name=name, phone=phone, email=email, subject=subject, message=message)
            contact.save()
            messages.add_message(request,messages.SUCCESS, "Your message has been successfully sent")
            return redirect("home")
    # else:
    #     return HttpResponse("page not found")
    return render(request,"client/index.html")

@login_required(login_url="/accounts/login")
def breakdown(request):
    return render(request, "client/breakdown.html")

@login_required(login_url="/accounts/login")
def fual(request):
    return render(request, "client/fueldelivery.html")

@login_required(login_url="/accounts/login")
def location(request):
    nearby_fuelstation = []
    nearby_mechanic = []
    if request.method == "POST":
        lat = request.POST['lat']
        lang = request.POST['lang']
        
        fuelstations = ServiceProvider.objects.filter(service_type='fual_station')
        mechanics = ServiceProvider.objects.filter(service_type='MECHANIC')
        
        for fuelstation in fuelstations:
            distance = get_distance(float(lat),float(lang),float(fuelstation.lat),float(fuelstation.lang))
            if distance <= 5:
                fuelstation.distance = distance
                fuelstation.url = "https://www.google.com/maps/search/?api=1&query="+fuelstation.lat+","+fuelstation.lang
                nearby_fuelstation.append(fuelstation)
                
                
        for mechanic in mechanics:
            distance = get_distance(float(lat),float(lang),float(mechanic.lat),float(mechanic.lang))
            if distance <= 5:
                mechanic.distance = distance
                mechanic.url = "https://www.google.com/maps/search/?api=1&query="+mechanic.lat+","+mechanic.lang
                nearby_mechanic.append(mechanic)
    
    context = {
        'fuelstations':nearby_fuelstation,
        'mechanics':nearby_mechanic
    }
    return render(request, "client/location.html", context)


def get_distance(lat1, lon1, lat2, lon2):
    lat1, lon1, lat2, lon2 = map(radians, [lat1, lon1, lat2, lon2])
    dlat = lat2 - lat1
    dlon = lon2 - lon1
    # Apply the Haversine formula
    a = sin(dlat / 2) ** 2 + cos(lat1) * cos(lat2) * sin(dlon / 2) ** 2
    c = 2 * atan2(sqrt(a), sqrt(1 - a))
    distance = 6371 * c
    return distance

@login_required(login_url="/accounts/login")
def feedback(request):
    if request.method == "POST":
        user = request.user.id
        name = request.POST.get('name')
        rating = request.POST.get('rating')
        message = request.POST.get('message')
        
        feedback = Feedback(user_id=user, name=name, rating=rating, message=message)
        feedback.save()
        messages.add_message(request, messages.SUCCESS, "Your Feedback are sent successfully")
        return redirect("home")
    return render(request, "client/feedback.html")