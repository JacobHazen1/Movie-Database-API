from django.shortcuts import render
from django.db import connection
from django.http import JsonResponse
from django.http import HttpResponse
import json
import sys

cursor = connection.cursor()

# --------------------------------------------------------------------------
# -------------------------Sample Code Snippets ----------------------------
# --------------------------------------------------------------------------
# class MyClass(View):
#     def get(self, request):
#         # your code...
#     def post(self, request):
#         # your code...
#     def put(self, request):
#         # your code...
#     def delete(self, request):
#         # your code...

def my_custom_sql():
    cursor.execute("SELECT User_ID, Username FROM movieapi.user")
    row = cursor.fetchall()
    return row

#CUSTOM SQL
# def usertest(request):
#     sql = my_custom_sql()
#     b = ([{"USER_ID": i[0], "USERNAME": i[1]} for i in sql])
#     return JsonResponse(b, safe=False)

#STORED PROCEDURE
def usertest(request):
    cursor.callproc('movieapi.usertestSP')
    sql = cursor.fetchall()
    #dictionary comprehension
    b = ([{"USER_ID": i[0], "USERNAME": i[1]} for i in sql])
    return JsonResponse(b, safe=False)


# class specificMovieTheatre():
#     def get(self, request):
#         cursor.execute("""SELECT M.Movie_ID, M.Title, T.Name, MSI.Start_time, MSI.End_time
#                         FROM movieapi.theater AS T, movieapi.movie AS M, 
#                         movieai.movie_showing_instance AS MSI""")
#         row = cursor.fetchall()

# --------------------------------------------------------------------------
# -------------------------Actual Procedures--------------------------------
# --------------------------------------------------------------------------
def home(request):
    resultSetJson = {'message': 'Welcome to our Movie Database API'}
    return JsonResponse(resultSetJson)

def rank_endpoint(request):
    if request.method == 'GET':
        try:
            # Grab keyword arguments
            count = request.GET.get('count')

            # Call stored procedure
            cursor.callproc('movieapi.rank_endpoint', [count])
            resultSet = cursor.fetchall()

            # Get column names from cursor
            column_names_list = [x[0] for x in cursor.description]

            # Construct list of dict objects for Json ouput
            resultSetJson = {'data':[dict(zip(column_names_list, row)) for row in resultSet]}
        except:
            resultSetJson = {
                'source': 'rank/',
                'message': 'Invalid count value',
                'detail': sys.exc_info()[0]
            }   
    else:
        resultSetJson = {
                'source': 'rank/',
                'message': 'Invalid request method',
                'detail': 'Request method must be GET'
            }
    return JsonResponse(resultSetJson)
        

def genre_endpoint(request):
    if request.method == 'GET':
        try:
            # Grab keyword arguments
            genre = request.GET.get('genre')

            # Call stored procedure
            cursor.callproc('movieapi.genre_endpoint', [genre])
            resultSet = cursor.fetchall()

            # Get column names from cursor
            column_names_list = [x[0] for x in cursor.description]

            # Construct list of dict objects for Json ouput
            resultSetJson = {'data':[dict(zip(column_names_list, row)) for row in resultSet]}
        except:
            resultSetJson = {
                'source': 'genre/',
                'message': 'Invalid genre value',
                'detail': sys.exc_info()[0]
            }   
    else:
        resultSetJson = {
                'source': 'genre/',
                'message': 'Invalid request method',
                'detail': 'Request method must be GET'
            }
    return JsonResponse(resultSetJson)

def timeslot_endpoint(request):
    if request.method == 'GET':
        try:
            # Grab keyword arguments
            theater_name = request.GET.get('theater_name')
            time_start = request.GET.get('time_start')
            time_end = request.GET.get('time_end')

            # Call stored procedure
            cursor.callproc('movieapi.timeslot_endpoint', [theater_name, time_start, time_end])
            resultSet = cursor.fetchall()

            # Get column names from cursor
            column_names_list = [x[0] for x in cursor.description]

            # Construct list of dict objects for Json ouput
            resultSetJson = {'data':[dict(zip(column_names_list, row)) for row in resultSet]}
        except :
            resultSetJson = {
                'source': 'timeslot/',
                'message': 'Invalid time start/end values',
                'detail': sys.exc_info()[0]
            }   
    else:
        resultSetJson = {
                'source': 'timeslot/',
                'message': 'Invalid request method',
                'detail': 'Request method must be GET'
            }
    return JsonResponse(resultSetJson)

def specific_movie_theater_endpoint(request):
    if request.method == 'GET':
        try:
            # Grab keyword arguments
            theater_name = request.GET.get('theater_name')
            d_date = request.GET.get('d_date')

            # Call stored procedure
            cursor.callproc('movieapi.specific_movie_theater_endpoint', [theater_name, d_date])
            resultSet = cursor.fetchall()

            # Get column names from cursor
            column_names_list = [x[0] for x in cursor.description]

            # Construct list of dict objects for Json ouput
            resultSetJson = {'data':[dict(zip(column_names_list, row)) for row in resultSet]}
        except :
            resultSetJson = {
                'source': 'specific_movie_theater/',
                'message': 'Invalid date value',
                'detail': sys.exc_info()[0]
            }   
    else:
        resultSetJson = {
                'source': 'specific_movie_theater/',
                'message': 'Invalid request method',
                'detail': 'Request method must be GET'
            }
    return JsonResponse(resultSetJson, safe=False)