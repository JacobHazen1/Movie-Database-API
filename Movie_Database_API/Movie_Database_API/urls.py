"""Movie_Database_API URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home, name='home'),
    path('rank/', views.rank_endpoint, name='rank_endpoint'), # Rank endpoint
    path('genre/', views.genre_endpoint, name='genre_endpoint'), # Genre endpoint
    path('timeslot/', views.timeslot_endpoint, name='timeslot_endpoint'), # TimeSlot endpoint
    path('specific_movie_theater/', views.specific_movie_theater_endpoint, name='specific_movie_theater_endpoint'), # Specific movie theater endpoint
    path('mpaa_rating/', views.mpaa_rating_endpoint, name='mpaa_rating_endpoint'), # Specific MPAA rating endpoint
    path('language/', views.language_endpoint, name='language_endpoint'), # Specific language endpoint
    path('add_movie/', views.add_movie_endpoint, name='add_movie_endpoint'), # Endpoint for adding movies
    path('upcoming_movies/', views.upcoming_movies_endpoint, name='upcoming_movies_endpoint'), # Endpoint for upcming movies
	path('search_performer/', views.search_performer_endpoint, name='search_performer_endpoint'), # Search performer endpoint
	path('give_rating/', views.give_rating_endpoint, name='give_rating_endpoint'), # Give rating endpoint
	path('new_movies/', views.new_movies_endpoint, name='new_movies_endpoint'), # New movies endpoint
	path('top_gross/', views.top_gross_endpoint, name='top_gross_endpoint') # Top gross endpoint
]
