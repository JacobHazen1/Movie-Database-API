from django.shortcuts import render
from django.db import connection
from django.http import JsonResponse
from django.http import HttpResponse

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
def my_custom_sql():
    cursor = connection.cursor()
    cursor.execute("SELECT User_ID, Username FROM movieapi.user")
    row = cursor.fetchall()
    return row

def usertest(request):
    sql = my_custom_sql()
    data = {"results": sql
    }
    return JsonResponse(data)

# def (self, request):
#     cursor = connection['default'].cursor()
#     cursor.execute("SELECT Username FROM movieapi.user")
#     row = cursor.fetchone()
#     print(row)
#     return JsonResponse({'questions': row})
