"""classweb URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from classweb_app import views

from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views

#from classweb_app.views import VerificationView
from django.contrib.auth import views as auth_views
from django.views.static import serve
from django.conf.urls import url

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index, name='index'),
    path('loginpage', views.loginpage, name='loginpage'),
    path('about_course', views.about_course, name='about_course'),
    path('contact', views.contact, name='contact'),
    path('registration', views.registration, name='registration'),

    path('unique_page', views.unique_page, name='unique_page'),
    path('instructor', views.instructor, name="instructor"),
    path('student', views.student, name="student"),
    path('add_assignment', views.add_assignment, name="add_assignment"),
    path('all_assignment', views.all_assignment, name="all_assignment"),

     path('current_assignment', views.current_assignment, name="current_assignment"),
    path('download/', views.DownloadFileView.as_view(), name="DownloadFileView"),
    path('pelcon', views.PelconView.as_view(), name="pelcon"),
    path('myupload/', views.myUpload, name='myupload'),
    path('upload/', views.uploadFile, name='upload'),
    path('files/', views.FileView.as_view(), name='files'),
    path('pelconUpload/', views.pelconUpload, name='pelconUpload'),
] 



if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)