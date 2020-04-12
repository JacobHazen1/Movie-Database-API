from django.shortcuts import render
from django.db import connection
from django.http import JsonResponse
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
import json

cursor = connection.cursor()

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
            resultSetJson = {
                'data': [dict(zip(column_names_list, row)) for row in resultSet]}
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
            resultSetJson = {
                'data': [dict(zip(column_names_list, row)) for row in resultSet]}
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
            cursor.callproc('movieapi.timeslot_endpoint', [
                            theater_name, time_start, time_end])
            resultSet = cursor.fetchall()

            # Get column names from cursor
            column_names_list = [x[0] for x in cursor.description]

            # Construct list of dict objects for Json ouput
            resultSetJson = {
                'data': [dict(zip(column_names_list, row)) for row in resultSet]}
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
            cursor.callproc('movieapi.specific_movie_theater_endpoint', [
                            theater_name, d_date])
            resultSet = cursor.fetchall()

            # Get column names from cursor
            column_names_list = [x[0] for x in cursor.description]

            # Construct list of dict objects for Json ouput
            resultSetJson = {
                'data': [dict(zip(column_names_list, row)) for row in resultSet]}
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
            resultSetJson = {'data': []}

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
            resultSetJson = {'data': []}
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
            resultSetJson = {'data': []}
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


@csrf_exempt
def add_movie_endpoint(request):
    if request.method == 'POST':
        try:
            # Grab keyword arguments
            title = request.POST.get('title')
            release = request.POST.get('release')
            length = request.POST.get('length')
            description = request.POST.get('description')
            mpaa_rating = request.POST.get('mpaa_rating')

            # Return an error response if invalid data is input
            if(title == None):
                raise Exception('ValueError. No title was inserted')
            if (mpaa_rating != 'PG' and mpaa_rating != 'R' and mpaa_rating != 'PG-13' and mpaa_rating != 'G'):
                raise Exception('ValueError. Invalid MPAA rating was inserted')

            genres = request.POST.getlist('genre')
            directors = request.POST.getlist('director')
            performers = request.POST.getlist('performer')
            languages = request.POST.getlist('language')

            # Call stored procedure to create a movie
            cursor.callproc('movieapi.add_movie_endpoint', [
                            title, release, length, description, mpaa_rating])

            # Get the primary key of the created movie;
            movie_id = cursor.fetchall()[0][0]

            # insert each genre into database
            for genre in genres:
                cursor.callproc('movieapi.add_genre', [movie_id, genre])

            # insert each director into database
            for director in directors:
                # split names into name components
                names = director.split(' ')

                # get the first name
                f_name = names[0]

                # Get the last and middle names
                if(len(names) > 2):
                    # All the names that arent in the first name or last name is joined into middle name
                    m_name = ' '.join(names[1:len(names) - 1])
                    l_name = names[len(names) - 1]
                elif(len(names) == 2):
                    m_name = ''
                    l_name = l_name = names[len(names) - 1]
                else:
                    m_name = ''
                    l_name = ''

                # Insert the director into the database
                cursor.callproc('movieapi.add_film_worker', [
                                f_name, m_name, l_name, 1, 0])
                director_id = cursor.fetchall()[0][0]
                cursor.callproc('movieapi.add_director_to_movie', [
                                movie_id, director_id])

            # insert each performer into the database
            for performer in performers:
                # split names into name components
                names = performer.split(' ')

                # get the first name
                f_name = names[0]

                # Get the last and middle names
                if(len(names) > 2):
                    # All the names that arent in the first name or last name is joined into middle name
                    m_name = ' '.join(names[1:len(names) - 1])
                    l_name = names[len(names) - 1]
                elif(len(names) == 2):
                    m_name = ''
                    l_name = l_name = names[len(names) - 1]
                else:
                    m_name = ''
                    l_name = ''

                # Insert the performer into the database
                cursor.callproc('movieapi.add_film_worker', [
                                f_name, m_name, l_name, 0, 1])
                actor_id = cursor.fetchall()[0][0]
                cursor.callproc('movieapi.add_performer_to_movie', [
                                movie_id, actor_id])

            # insert each langauge of the movie into database
            for langauge in languages:

                cursor.callproc('movieapi.add_language', [movie_id, langauge])

            # Construct the success message
            success_string = "Successfully added movie " + \
                str(title) + " with Movie_ID " + str(movie_id)
            resultSetJson = {'message': success_string, "success": True}
        except Exception as ex:
            resultSetJson = {
                'source': 'add_movie/',
                'message': 'Error. Invalid parameter input',
                'detail': str(ex)
            }
    else:
        resultSetJson = {
            'source': 'add_movie/',
            'message': 'Error. Invalid request method',
            'detail': 'Request method must be POST'
        }
    return JsonResponse(resultSetJson, safe=False)


def search_performer_endpoint(request):
    if request.method == 'GET':
        try:
            # Grab keyword arguments
            performer_name = request.GET.get('performer_name')
            performer_name = performer_name.lower()

            # split names into name components
            names = performer_name.split(' ')
            f_name = names[0]

            if(len(names) > 2):
                # All the names that arent in the first name or last name is joined into middle name
                m_name = ' '.join(names[1:len(names) - 1])
                l_name = names[len(names) - 1]
            elif(len(names) == 2):
                m_name = ''
                l_name = l_name = names[len(names) - 1]
            else:
                m_name = ''
                l_name = ''

            # Call stored procedure
            cursor.callproc(
                'movieapi.search_performer_endpoint', [f_name, l_name])
            resultSet = cursor.fetchall()

            # Get column names from cursor
            column_names_list = [x[0] for x in cursor.description]

            # Construct list of dict objects for Json output
            resultSetJson = {
                'data': [dict(zip(column_names_list, row)) for row in resultSet]}
        except Exception as ex:
            resultSetJson = {
                'source': 'search_performer/',
                'message': 'Error: Invalid performer name.',
                'detail': str(ex)
            }
    else:
        resultSetJson = {
            'source': 'search_performer/',
            'message': 'Invalid request method',
            'detail': 'Request method must be GET'
        }
    return JsonResponse(resultSetJson)


@csrf_exempt
def give_rating_endpoint(request):
    if request.method == 'POST':
        try:
            # Grab keyword arguments
            movie_title = request.POST.get('movie_title')
            movie_title = movie_title.lower()
            username = request.POST.get('username')
            username = username.lower()
            rating = request.POST.get('rating')
            rating = int(rating)
            if rating < 0:
                raise Exception('ValueError. Rating cannot be < 0.')
            r_description = request.POST.get('r_description')

            # Call stored procedure
            cursor.callproc('movieapi.give_rating_endpoint', [
                            movie_title, username, rating, r_description])
            resultSet = cursor.fetchall()

            # Construct the success message
            success_string = "Successfully added review for " + \
                str(movie_title) + " by user: " + str(username)
            resultSetJson = {'message': success_string, "success": True}
        except Exception as ex:
            resultSetJson = {
                'source': 'give_rating/',
                'message': 'Error: Invalid input.',
                'detail': str(ex)
            }
    else:
        resultSetJson = {
            'source': 'give_rating/',
            'message': 'Invalid request method',
            'detail': 'Request method must be POST'
        }
    return JsonResponse(resultSetJson)


def new_movies_endpoint(request):
    if request.method == 'GET':
        try:
            # Grab keyword arguments
            r_date = request.GET.get('r_date')

            # Call stored procedure
            cursor.callproc('movieapi.new_movies_endpoint', [r_date])
            resultSet = cursor.fetchall()

            # Get column names from cursor
            column_names_list = [x[0] for x in cursor.description]

            # Construct list of dict objects for Json output
            resultSetJson = {
                'data': [dict(zip(column_names_list, row)) for row in resultSet]}
        except Exception as ex:
            resultSetJson = {
                'source': 'new_movies/',
                'message': 'Error: Invalid date value.',
                'detail': str(ex)
            }
    else:
        resultSetJson = {
            'source': 'new_movies/',
            'message': 'Invalid request method',
            'detail': 'Request method must be GET'
        }
    return JsonResponse(resultSetJson)


def top_gross_endpoint(request):
    if request.method == 'GET':
        try:
            # Grab keyword arguments
            in_theatres = request.GET.get('in_theatres')
            in_theatres = bool(in_theatres)
            count = request.GET.get('count')
            count = int(count)
            if count < 0:
                raise Exception('ValueError. Count cannot be < 0.')

            # Call stored procedure
            cursor.callproc('movieapi.top_gross_endpoint',
                            [in_theatres, count])
            resultSet = cursor.fetchall()

            # Get column names from cursor
            column_names_list = [x[0] for x in cursor.description]

            # Construct list of dict objects for Json output
            resultSetJson = {
                'data': [dict(zip(column_names_list, row)) for row in resultSet]}
        except Exception as ex:
            resultSetJson = {
                'source': 'top_gross/',
                'message': 'Error: Invalid count value.',
                'detail': str(ex)
            }
    else:
        resultSetJson = {
            'source': 'top_gross/',
            'message': 'Invalid request method',
            'detail': 'Request method must be GET'
        }
    return JsonResponse(resultSetJson)
