import 'package:flutter/material.dart';
//import 'package:mein/cart.dart';
import 'main_page.dart';
//import 'package:mein/menuAR.dart';
import 'menudetail.dart';
//import 'package:mein/ocr_flutter.dart';
import 'ocrresult.dart';
import 'restaurantDetail.dart';
//import 'package:mein/camera_1.dart';
//import 'package:mein/camera_2.dart';
// import 'package:mein/camera_3.dart';
//import 'package:mein/map.dart';
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
        //'/camera_1': (context) => Camera_1(),
        //'/camera_2': (context) => Camera_2(),
        // '/camera_3': (context) => Camera_3(),
        '/menudetail': (context) => MenuDetail(),
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
