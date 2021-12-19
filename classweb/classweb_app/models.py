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
    assignment_name = models.CharField(max_length=255)
    due_date = models.DateField()
    description = models.TextField()
    status = models.BooleanField(default=True)
    file = models.FileField(upload_to='store/stu_files')

    
    class Meta:
        db_table = 'stu_file'




class Pelcone(models.Model):
    name = models.CharField(max_length=100)
    owner = models.CharField(max_length=100)
    pdf = models.FileField(upload_to='store/pdfs')
    


    class Meta:
        db_table = 'pelcone'

    def __str__(self):
        return self.name





class AssignmentDisplay(models.Model):
    name = models.CharField(max_length=100)
    due_date = models.DateField()
    pdf = models.FileField(upload_to='store/assignments')
    


    class Meta:
        db_table = 'assignment_display'

    def __str__(self):
        return self.name




    
