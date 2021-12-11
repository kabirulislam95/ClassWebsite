from django.contrib import admin

from classweb_app.models import ProfessorUniqueId, StudentUniqueId

# Register your models here.
admin.site.register(StudentUniqueId)
admin.site.register(ProfessorUniqueId)