# coding=utf-8
from django.urls import path, include
from api import views
# from .views import UserViewSet
from rest_framework.routers import DefaultRouter

# urlpatterns = [
#     path('post/', views.PostList.as_view()),
#     path('post/<int:pk>', views.PostDetail.as_view())
#     ]

# ViewSet
router = DefaultRouter()
# router.register(r'users', UserViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('ingre/',views.findIncludePercent)
 ]