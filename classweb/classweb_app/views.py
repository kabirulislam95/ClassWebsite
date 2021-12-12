from django.shortcuts import render, redirect
from django.http.response import Http404, HttpResponseForbidden, HttpResponseRedirect
from django.http import request, response
from django.views import View
from django.contrib.auth.models import User, auth
from django.contrib import messages
from django.urls.base import reverse
from classweb_app.models import AllAssignment


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
            return render(request, 'registration.html')
        
        elif ProfessorUniqueId.objects.filter(institution_id = institution_id, unique_id = unique_id).exists():
            return render(request, 'registration.html')
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
            return render(request, 'instructor.html')
        
        elif user is not None and not user.is_staff:
            auth.login(request, user)
            return render(request, 'student.html')
        else:
            messages.info(request, 'Check your credentials')
            return render(request, 'loginpage.html')
    else:
        return render(request, 'loginpage.html')


def instructor(request):
        return render(request, 'instructor.html')

def student(request):
        return render(request, 'student.html')

def add_assignment(request):
    if request.method == 'POST':
        assignment_name = request.POST.get('assignment_name')
        description = request.POST.get('description')
        due_date = request.POST.get('due_date')
        if len(request.FILES) != 0:
            file = request.FILES.get('file')
        ass = AllAssignment()
        if assignment_name != "":
            ass.assignment_name = assignment_name
            ass.description = description
            ass.due_date = due_date
            if len(request.FILES) != 0:
                ass.file=file

            ass.save()
            return render(request, 'index.html')
        else:
            return render(request, 'add_assignment.html')
    else:
        return render(request, 'add_assignment.html')

def all_assignment(request):
        return render(request, 'all_assignment.html')

def show(request):
    Student = StudentUniqueId.objects.all()
    return render(request,"dataDisplay.html",{'StudentUniqueId':Student})

def show(request):
    Professor = ProfessorUniqueId.objects.all()
    return render(request,"dataDisplay.html",{'ProfessorUniqueId':Professor})  

def show(request):
    assignment = AllAssignment.objects.all()
    return render(request,"dataDisplay.html",{'AllAssignment':assignment})