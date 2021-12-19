from django.shortcuts import render, redirect
from django.http.response import Http404, HttpResponseForbidden, HttpResponseRedirect, HttpResponse
from django.http import request, response
from django.urls.conf import path
from django.views import View
from django.contrib.auth.models import User, auth
from django.contrib import messages
from django.urls.base import reverse

from classweb_app.models import AllAssignment, Pelcone, Files
from datetime import date
from django.views import generic



from django.core.mail import EmailMessage
from django.utils.encoding import force_bytes, force_text, DjangoUnicodeDecodeError
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.contrib.sites.shortcuts import get_current_site
from django.urls import reverse
from .utils import token_generator

import mimetypes
import os
from django.conf import settings



from classweb_app.models import AllAssignment
from django.conf import settings
from django.core.mail import send_mail




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

        if password == confirm_password:

            if User.objects.filter(username=username).exists():
                messages.info(request, "Username has already been taken")
                return redirect("registration")

            elif User.objects.filter(email=email).exists():
                messages.info(request, "You already have an account please login")
                return redirect("registration")
            else:
                user = User.objects.create_user(username=username, password=password, email=email, first_name=first_name, last_name=last_name)
                user.is_active = False
                user.save()
                domain = get_current_site(request).domain
                uidb64 = urlsafe_base64_encode(force_bytes(user.pk))

                link = reverse('activate', kwargs={'uidb64':uidb64, 'token': token_generator.make_token(user)})
                email_subject = 'Activate your account'
                activate_url = 'http://'+domain+link
                email_body = 'Hi '+ user.first_name+'. please use this link to verify your account\n' + activate_url
                email = EmailMessage(
                        email_subject,
                        email_body,
                        'noreply@techeria.com',
                    [email],
                    ['bcc@example.com'],

                )
                email.send(fail_silently=False)


                messages.success(request, 'A verification link has been send to your email. Please confirm the link')
                return redirect("loginpage")

        else:
            messages.info(request, "Password does not match")
            return redirect("registration")


        user = User.objects.create_user(username=username, password=password, email=email, first_name=first_name, last_name=last_name)
        user.save()
        return render(request, 'loginpage.html')


    else:
        return render(request, 'registration.html')





def loginpage(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user=auth.authenticate(username=username,password=password)
        
        if user is not None and user.is_staff and not user.is_superuser:
            auth.login(request, user)
            return redirect ("pelcon")
        
        elif user is not None and not user.is_staff and not user.is_superuser:
            auth.login(request, user)
            return redirect ("pelcon2")

        elif user is not None and user.is_superuser:
            auth.login(request, user)
            return redirect ("admin/")
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
        status = True
        if len(request.FILES) != 0:
            file = request.FILES.get('file')
         
            
        ass = AllAssignment()
        if assignment_name != "":
            ass.assignment_name = assignment_name
            ass.description = description
            ass.due_date = due_date
            ass.status = status
            if len(request.FILES) != 0:
                ass.file=file

            ass.save()
            return render(request, 'index.html')
        else:
            return render(request, 'add_assignment.html')
    else:
        return render(request, 'add_assignment.html')



def all_assignment(request):
        ass = AllAssignment.objects.all()
        context = {'ass' : ass}
        return render(request, 'all_assignment.html', context)


def current_assignment(request):
   
    today = date.today()
    ass = AllAssignment.objects.all().filter(due_date__gt = today)
    context = {'ass' : ass}
    return render(request, 'current_assignment.html', context)



class DownloadFileView(View):
    def get(self, request):
        filename = request.GET.get('file', None)
        filepath = f'{settings.BASE_DIR}/media/{filename}'
        try:
            with open(filepath, 'rb') as _file:
                mime_type, _ = mimetypes.guess_type(filepath)
                response = HttpResponse(_file, content_type=mime_type)
                response['Content-Disposition'] = "attachment; filename=%s" % filename
                return response
        except FileNotFoundError:
            raise Http404()



# class FileView(generic.ListView):
#     model = Files
#     template_name = 'file.html'
#     context_object_name = 'files'
#     paginate_by = 6

#     def get_queryset(self):
#     	return Files.objects.order_by('-id')





def uploadForm(request):
	return render(request, 'upload.html')


# def uploadFile(request):
#     if request.method == 'POST':
#         filename = request.POST['filename']
#         owner = request.POST['owner']
#         pdf = request.FILES['pdf']
#         # cover = request.FILES['cover']

#         a = Files(filename=filename, owner=owner, pdf=pdf, cover=cover)
#         a.save()
#         messages.success(request, 'Files Submitted successfully!')
#         return redirect('files')
#     else:
#     	messages.error(request, 'Files was not Submitted successfully!')
#     	return redirect('myupload')






class PelconView(generic.ListView):
	model = Pelcone
	template_name = 'pelcon.html'
	context_object_name = 'files'
	paginate_by = 4


	def get_queryset(self):
		return Pelcone.objects.order_by('-id')





class AllAssignmentView(generic.ListView):
	model = AllAssignment
	template_name = 'all_assignment.html'
	context_object_name = 'files'
	paginate_by = 4


	def get_queryset(self):
		return AllAssignment.objects.order_by('-id')





def myUpload(request):
	return render(request, 'myUpload.html')



def pelconUpload(request):
	if request.method == 'POST':
		name = request.POST['name']
		owner = request.POST.get('owner')
		pdf = request.FILES['pdf']
		# cover = request.FILES['cover']

		a = Pelcone(name=name, owner=owner, pdf=pdf)
		a.save()
		messages.success(request, 'Files was Submitted successfully')
		return redirect('pelcon')
	else:
		messages.error(request, 'Files was not Submitted successfully')
		return redirect('myupload')







# here is for the student_____***********************)))))))

class PelconView2(generic.ListView):
	model = Pelcone
	template_name = 'pelcon2.html'
	context_object_name = 'files'
	paginate_by = 4


	def get_queryset(self):
		return Pelcone.objects.order_by('-id')


class VerificationView(View):
    def get(self, request, uidb64, token):
        try:
            id = force_text(urlsafe_base64_decode(uidb64))
            user = User.objects.get(pk=id)

            if not token_generator.check_token(user, token):
                return redirect('loginpage' + '?message=' + 'user already activate')
            if user.is_active:
                return redirect('loginpage')
            user.is_active = True
            user.save()
            messages.success(request, 'Account activated successfully')
            return redirect('loginpage')
        except Exception as ex:
            pass
        return redirect('loginpage')

def current_assignment(request):
        return render(request, 'current_assignment.html')


