from django.db import models

# Create your models here.
class Theater(models.Model):
    Name = models.CharField(max_length=200)
    Zip_code = models.CharField(max_length=20)
    Address = models.TextField()
    City = models.TextField()
    Opening_time = models.TimeField(("Opening"), auto_now=False, auto_now_add=False, null=True)
    Closing_time = models.TimeField(("Closing"), auto_now=False, auto_now_add=False, null=True)
    Phone_number = models.CharField(max_length=12, null=True)
#Theater.objects.raw('SELECT Theater_ID, Name, Zip_code, Address, City FROM theater_theater')


    # def __str__(self):
    #     return self.Name
    