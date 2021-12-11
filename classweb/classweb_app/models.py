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



class AllAssignment(models.Model):
    file = models.FileField(upload_to='files/')
    # cat_image = models.ImageField(upload_to='images/', blank=True)

    assignment_name = models.CharField(max_length=255)
    due_date = models.DateField()
    description = models.TextField()
    # slug = models.SlugField(max_length=100, unique=True)
    
    class Meta:
        db_table = 'assignment'

    def __str__(self):
    	return self.assignment_name

    
