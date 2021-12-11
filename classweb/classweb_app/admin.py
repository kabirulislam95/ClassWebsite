from django.contrib import admin

from classweb_app.models import ProfessorUniqueId, StudentUniqueId, AllAssignment

# Register your models here.
admin.site.register(StudentUniqueId)
admin.site.register(ProfessorUniqueId)
admin.site.register(AllAssignment)