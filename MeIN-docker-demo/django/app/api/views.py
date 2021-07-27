# coding=utf-8
from django.shortcuts import render
from rest_framework import status, mixins

# from .models import User
from django.http import JsonResponse, Http404
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser

from django.http import HttpResponse
from django.views import View
from rest_framework.response import Response

# Permission
from rest_framework import permissions
# from background_task import background

#firebase
import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from firebase_admin import firestore, initialize_app
 
#Firebase database 인증 및 앱 초기화
cred = credentials.Certificate('api/credentials.json')
firebase_admin.initialize_app(cred,{
    'databaseURL' : 'https://triple-h-for-graduate.firebaseio.com'
})
db = firestore.client()

def findIncludePercent(request):
    if request.method == "POST":
        _findIncludePercent()
        return JsonResponse({"sucess":"bb"})

# @background(schedule=600)
def _findIncludePercent():
    # db.collection(u'foodrawdata').where(u'RCP_NM',u'==',u'돼지갈비 볶음').stream()
    # 음식 찾기
    foods =  db.collection(u'foodrawdata').stream()
    for food in foods:
        food_dict = food.to_dict()
        recipes = db.collection(u'foodrawdata').where(u'RCP_NM',u'==',food_dict["RCP_NM"]).stream()
        ingredient_list = []
        count_list = []
        ingredient_info_list = []
        index = 0 
        for recipe in recipes:
            index = index +1 
            ingredient_dict = recipe.to_dict()
              # ingredients = ingredient_dict["ingredients"]
            for i in range(25):
                ingredient_list.append(ingredient_dict[str(i)])
        recipe_num = index

        # 재료 중복 제거
        unique_ingredient_list = list(set(ingredient_list))

        # 음식 비율 계산 & 재료 정보 찾기
        for l in unique_ingredient_list:
            count_list.append(ingredient_list.count(l)/recipe_num*100)
            info = db.collection(u'ingredientrawdata').where(u'name', u'==',l)
            if info:
                ingredient_info_list.append(info)
            else :
                ingredient_info_list.append({
                    "isvegan":False,
                    "isallergy":False
                })
            
        ingredient_array = []

        for i in range(len(unique_ingredient_list)):
            ingredient_info = db.collection(u'ingredientrawdata').where(u'name', u'==',unique_ingredient_list[i])
            for doc in ingredient_info.stream():
                vegan = doc.to_dict()["isvegan"]
                allergy = doc.to_dict()["isallergy"]

                ingredient_array.append({
                    'name': unique_ingredient_list[i],
                    'percent':count_list[i],
                    'isvegan': vegan,
                    'isallergy':allergy
                    # [i].to_dict()["isallergy"]
                })

        db.collection(u'foodingredient').add({
            u'name': u'칼륨 듬뿍 고구마죽',
            u'ingredient': ingredient_array,
            })
            
    return Response({"data" : "sucess"})
                