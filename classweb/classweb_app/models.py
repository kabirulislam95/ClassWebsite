from django.db import models

# Create your models here.


class StudentUniqueId(models.Model):
    institution_id = models.BigIntegerField()
    unique_id = models.CharField(max_length=100)
    
    class Meta:
        db_table = "student_unique_id"


class ProfessorUniqueId(models.Model):
    institution_id = models.BigIntegerField()
    unique_id = models.CharField(max_length=10)
    
    class Meta:
        db_table = "professor_unique_id"
