from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.http import response
from django.views import View
from django.contrib.auth.models import User, auth
from django.contrib import messages

from classweb_app.models import ProfessorUniqueId, StudentUniqueId


# Create your views here.
def index(request):
    return render(request, 'index.html')

def about_course(request):
    return render(request, 'about_course.html')

def contact(request):
    return render(request, 'contact.html')

def unique_page(request):
    if request.method == 'POST':
        institution_id = request.POST.get('institution_id')
        unique_id = request.POST.get('unique_id')
        
        if StudentUniqueId.objects.filter(institution_id = institution_id, unique_id = unique_id).exists():
            return redirect("/")
        
        elif ProfessorUniqueId.objects.filter(institution_id = institution_id, unique_id = unique_id).exists():
            return redirect("/")
        else:
            messages.info(request, 'Check your credentials')
            return render(request, 'unique_page.html')
    else:
        return render(request, 'unique_page.html')


def registration(request):

    if request.method == 'POST':
        first_name = request.POST ['first_name']
        last_name = request.POST ['last_name']
        email = request.POST ['email']  
        username = request.POST['username'] 
        password = request.POST ['password']
        confirm_password = request.POST ['confirm_password']
        user = User.objects.create_user(username=username, password=password, email=email, first_name=first_name, last_name=last_name)
        user.save()
        return render(request, 'loginpage.html')

    else:
        return render(request, 'registration.html')





def loginpage(request):
    if request.method == 'POST':
        username = request.POST ['username']
        password = request.POST ['password']
        user=auth.authenticate(username=username,password=password)
        
        if user is not None and user.is_staff:
            auth.login(request, user)
            return redirect("/")
        
        elif user is not None and not user.is_staff:
            auth.login(request, user)
            return redirect("/")
        else:
            messages.info(request, 'Check your credentials')
            return render(request, 'loginpage.html')
    else:
        return render(request, 'loginpage.html')