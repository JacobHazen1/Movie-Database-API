from django.urls import path, include
from . import views
from rest_framework import routers


router = routers.DefaultRouter()
router.register('theaters',views.TheaterView )

urlpatterns = [
    path('', include(router.urls))

]
