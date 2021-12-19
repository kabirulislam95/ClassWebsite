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
    # slug = models.SlugField(max_length=100, unique=True)
    
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



class Files(models.Model):
    filename = models.CharField(max_length=100)
    owner = models.CharField(max_length=100)
    pdf = models.FileField(upload_to='store/pdfs/')
    # cover = models.ImageField(upload_to='store/covers/', null=True, blank=True)

    def __str__(self):
        return self.filename

    class Meta:
        db_table = 'files'

    def delete(self, *args, **kwargs):
        self.pdf.delete()
        # self.cover.delete()
        super().delete(*args, **kwargs)


    
