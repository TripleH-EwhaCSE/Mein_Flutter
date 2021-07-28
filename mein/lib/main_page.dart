import 'package:flutter/material.dart';
// import 'package:mein/bottomnavigationbar.dart';
import 'package:mein/camera_3.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select the Image'),
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
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('menuImage'),
              onTap: () {
                Navigator.pushNamed(context, '/menuImage');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('cart'),
              onTap: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('restaurantdetail'),
              onTap: () {
                Navigator.pushNamed(context, '/restaurantdetail');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('menulist'),
              onTap: () {
                Navigator.pushNamed(context, '/menulist');
              },
            ), 
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('ocr'),
              onTap: () {
                Navigator.pushNamed(context, '/ocr');
              },
            )
          ],
        ),
      ),
      body: Camera_3(),
    );
  }
}
