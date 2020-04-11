from django.shortcuts import render
from django.db import connection
from django.http import JsonResponse
from django.http import HttpResponse
import json

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
            count = int(count) 
            if count < 0:
                raise Exception('ValueError. Count cannot be < 0')

            # Call stored procedure
            cursor.callproc('movieapi.rank_endpoint', [count])
            resultSet = cursor.fetchall()

            # Get column names from cursor
            column_names_list = [x[0] for x in cursor.description]

            # Construct list of dict objects for Json ouput
            resultSetJson = {'data':[dict(zip(column_names_list, row)) for row in resultSet]}
        except Exception as ex:
            resultSetJson = {
                'source': 'rank/',
                'message': 'Error. Invalid count value',
                'detail': str(ex)
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
            genre = genre.lower()

            # Call stored procedure
            cursor.callproc('movieapi.genre_endpoint', [genre])
            resultSet = cursor.fetchall()

            # Get column names from cursor
            column_names_list = [x[0] for x in cursor.description]

            # Construct list of dict objects for Json ouput
            resultSetJson = {'data':[dict(zip(column_names_list, row)) for row in resultSet]}
        except Exception as ex:
            resultSetJson = {
                'source': 'genre/',
                'message': 'Error. Invalid genre value',
                'detail': str(ex)
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
            theater_name = theater_name.lower()
            time_start = request.GET.get('time_start')
            time_end = request.GET.get('time_end')

            # Call stored procedure
            cursor.callproc('movieapi.timeslot_endpoint', [theater_name, time_start, time_end])
            resultSet = cursor.fetchall()

            # Get column names from cursor
            column_names_list = [x[0] for x in cursor.description]

            # Construct list of dict objects for Json ouput
            resultSetJson = {'data':[dict(zip(column_names_list, row)) for row in resultSet]}
        except Exception as ex:
            resultSetJson = {
                'source': 'timeslot/',
                'message': 'Error. Invalid time_end or time_start value',
                'detail': str(ex)
            }   
    else:
        resultSetJson = {
                'source': 'timeslot/',
                'message': 'Error. Invalid request method',
                'detail': 'Request method must be GET'
            }
    return JsonResponse(resultSetJson)

def specific_movie_theater_endpoint(request):
    if request.method == 'GET':
        try:
            # Grab keyword arguments
            theater_name = request.GET.get('theater_name')
            theater_name = theater_name.lower()
            d_date = request.GET.get('d_date')

            # Call stored procedure
            cursor.callproc('movieapi.specific_movie_theater_endpoint', [theater_name, d_date])
            resultSet = cursor.fetchall()

            # Get column names from cursor
            column_names_list = [x[0] for x in cursor.description]

            # Construct list of dict objects for Json ouput
            resultSetJson = {'data':[dict(zip(column_names_list, row)) for row in resultSet]}
        except Exception as ex:
            resultSetJson = {
                'source': 'specific_movie_theater/',
                'message': 'Error. Invalid date value',
                'detail': str(ex)
            }   
    else:
        resultSetJson = {
                'source': 'specific_movie_theater/',
                'message': 'Error. Invalid request method',
                'detail': 'Request method must be GET'
            }
    return JsonResponse(resultSetJson, safe=False)


def mpaa_rating_endpoint(request):
    if request.method == 'GET':
        try:
            # Grab keyword arguments
            mpaa_rating = request.GET.get('rating')
            mpaa_rating = mpaa_rating.lower()

            # Call stored procedure
            cursor.callproc('movieapi.mpaa_rating_endpoint', [mpaa_rating])
            resultSet = cursor.fetchall()

            # Get column names from cursor
            column_names_list = [x[0] for x in cursor.description]

            # Construct list of dict objects for Json ouput
            resultSetJson = {'data':[]}

            for row in resultSet:
                data = dict(zip(column_names_list, row))

                # Get the genres the movie has as an array (since they can have multiple)
                data['Genres'] = get_genres_as_array(data['Movie_ID'])
                resultSetJson['data'].append(data)
        except Exception as ex:
            resultSetJson = {
                'source': 'mpaa_rating/',
                'message': 'Error. Invalid MPAA rating input',
                'detail': str(ex)
            }   
    else:
        resultSetJson = {
                'source': 'mpaa_rating/',
                'message': 'Error. Invalid request method',
                'detail': 'Request method must be GET'
            }
    return JsonResponse(resultSetJson, safe=False)

def get_genres_as_array(movie_id):
    try:
        # Call stored procedure
        cursor.callproc('movieapi.all_genre_for_movie', [movie_id])
        resultSet = cursor.fetchall()

        # Get column names from cursor
        column_names_list = [x[0] for x in cursor.description]

        # Construct list of dict objects for Json ouput
        result = []
        for row in resultSet:
            result.append(row[0])
    except Exception as ex:
        result = [str(ex)]
        
    return result

def language_endpoint(request):
    if request.method == 'GET':
        try:
            # Grab keyword arguments
            language = request.GET.get('language')
            language = language.lower()

            # Call stored procedure
            cursor.callproc('movieapi.language_endpoint', [language])
            resultSet = cursor.fetchall()

            # Get column names from cursor
            column_names_list = [x[0] for x in cursor.description]

            # Construct list of dict objects for Json ouput
            resultSetJson = {'data':[]}
            for row in resultSet:
                data = dict(zip(column_names_list, row))

                # Get the genres the movie has as an array (since they can have multiple)
                data['Genres'] = get_genres_as_array(data['Movie_ID'])
                resultSetJson['data'].append(data)
        except Exception as ex:
            resultSetJson = {
                'source': 'language/',
                'message': 'Error. Invalid language input',
                'detail': str(ex)
            }   
    else:
        resultSetJson = {
                'source': 'language/',
                'message': 'Error. Invalid request method',
                'detail': 'Request method must be GET'
            }
    return JsonResponse(resultSetJson, safe=False)

def upcoming_movies_endpoint(request):
    if request.method == 'GET':
        try:
            # Call stored procedure
            cursor.callproc('movieapi.upcoming_movies')
            resultSet = cursor.fetchall()

            # Get column names from cursor
            column_names_list = [x[0] for x in cursor.description]

            # Construct list of dict objects for Json ouput
            resultSetJson = {'data':[]}
            for row in resultSet:
                data = dict(zip(column_names_list, row))

                # Get the genres the movie has as an array (since they can have multiple)
                data['Genres'] = get_genres_as_array(data['Movie_ID'])
                resultSetJson['data'].append(data)
        except Exception as ex:
            resultSetJson = {
                'source': 'upcoming_movies/',
                'message': 'Error. Invalid language input',
                'detail': str(ex)
            }   
    else:
        resultSetJson = {
                'source': 'upcoming_movies/',
                'message': 'Error. Invalid request method',
                'detail': 'Request method must be GET'
            }
    return JsonResponse(resultSetJson, safe=False)
