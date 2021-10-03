import 'package:flutter/material.dart';
// import 'package:mein/bottomnavigationbar.dart';
import 'camera_3.dart';
import 'dart:ui' as ui;

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // title:
        // Text("MeIN",style: TextStyle(foreground: Paint()
        //   ..shader = ui.Gradient.linear(
        //     const Offset(0, 20),
        //     const Offset(150, 20),
        //     <Color>[
        //       Colors.greenAccent,
        //       Colors.lightBlue,
        //     ],
        //   )),),
        title: Image.asset('images/MeIN.png'),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('main'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.home,
            //     color: Colors.grey[850],
            //   ),
            //   title: Text('menuImage'),
            //   onTap: () {
            //     Navigator.pushNamed(context, '/menuImage');
            //   },
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.home,
            //     color: Colors.grey[850],
            //   ),
            //   title: Text('cart'),
            //   onTap: () {
            //     Navigator.pushNamed(context, '/cart');
            //   },
            // ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('restaurantdetail'),
              onTap: () {
                Navigator.pushNamed(context, '/menudetail');
              },
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.home,
            //     color: Colors.grey[850],
            //   ),
            //   title: Text('menulist'),
            //   onTap: () {
            //     Navigator.pushNamed(context, '/menulist');
            //   },
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.home,
            //     color: Colors.grey[850],
            //   ),
            //   title: Text('ocr'),
            //   onTap: () {
            //     Navigator.pushNamed(context, '/ocr');
            //   },
            // ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('kakaoocr'),
              onTap: () {
                Navigator.pushNamed(context, '/kakaoocr');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('owner'),
              onTap: () {
                Navigator.pushNamed(context, '/owner');
              },
            ),
          ],
        ),
      ),
      body: Camera_3(),
    );
  }
}
