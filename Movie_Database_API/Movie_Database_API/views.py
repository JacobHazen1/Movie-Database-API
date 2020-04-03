from django.shortcuts import render
from django.db import connection
from django.http import JsonResponse
from django.http import HttpResponse
import json

# Create your views here.
# class MyClass(View):
#     def get(self, request):
#         # your code...
#     def post(self, request):
#         # your code...
#     def put(self, request):
#         # your code...
#     def delete(self, request):
#         # your code...
cursor = connection.cursor()
def my_custom_sql():
    cursor.execute("SELECT User_ID, Username FROM movieapi.user")
    row = cursor.fetchall()
    return row

# def usertest(request):
#     sql = my_custom_sql()
#     b = ([{"USER_ID": i[0], "USERNAME": i[1]} for i in sql])
#     return JsonResponse(b, safe=False)

def usertest(request):
    cursor.callproc('movieapi.usertestSP')
    sql = cursor.fetchall()
    # sql = cursor.execute("{call store.mysproc(?)}", (id))
    b = ([{"USER_ID": i[0], "USERNAME": i[1]} for i in sql])
    return JsonResponse(b, safe=False)


# class specificMovieTheatre():
#     def get(self, request):
#         cursor.execute("""SELECT M.Movie_ID, M.Title, T.Name, MSI.Start_time, MSI.End_time
#                         FROM movieapi.theater AS T, movieapi.movie AS M, 
#                         movieai.movie_showing_instance AS MSI""")
#         row = cursor.fetchall()
