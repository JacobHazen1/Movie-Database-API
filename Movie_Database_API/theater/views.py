from django.shortcuts import render
from rest_framework import viewsets
from .models import Theater
from .serializers import TheaterSerializer

# Create your views here.
class TheaterView(viewsets.ModelViewSet):
    queryset = Theater.objects.all()
    serializer_class = TheaterSerializer


# class ChangeTaskStatusView(View):
#     def get(self, request):
#         task = request.GET['task']
#         Tasks.objects.filter(id = task).update(status='trash')
#         return HttpResponse(task)