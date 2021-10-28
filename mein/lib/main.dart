import 'package:flutter/material.dart';
import 'main_page.dart';
import 'menudetail.dart';
import 'ocrresult.dart';
import 'restaurantDetail.dart';
import 'owner.dart';
import 'menuList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/owner': (context) => Owner(),
        //'/camera_1': (context) => Camera_1(),
        //'/camera_2': (context) => Camera_2(),
        // '/camera_3': (context) => Camera_3(),
        '/menudetail': (context) => MenuDetail(),
        //'/menuname': (context) => Food(),
        '/menulist': (context) => MenuList(),
        //'/menuImage': (context) => MenuImage(),
        //'/cart': (context) => Cart(),
        //'/map': (context) => MapView(),
        //'/restaurantdetail': (context) => RestaurantDetail(),
        //'/ocr': (context) => OCRPage(),
        '/kakaoocr': (context) => ocrresult(),
      },
    );
  }
}
