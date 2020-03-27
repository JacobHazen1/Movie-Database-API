from django.db import models

# Create your models here.
class Theater(models.Model):
    Theater_ID = models.IntegerField(max_length=50)
    Name = models.CharField(max_length=200)
    Zip_code = models.CharField(max_length=20)
    Address = models.TextField()
    City = models.TextField()
# theater.objects.raw('SELECT Theater_ID, Name, Zip_code, Address, City FROM theater_theater')