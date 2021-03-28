import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MainPage'),
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
              title: Text('camera_1'),
              onTap: () {
                Navigator.pushNamed(context, '/camera_1');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('camera_2'),
              onTap: () {
                Navigator.pushNamed(context, '/camera_2');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('camera_3'),
              onTap: () {
                Navigator.pushNamed(context, '/camera_3');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('menudetail'),
              onTap: () {
                Navigator.pushNamed(context, '/menudetail');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('menuAR'),
              onTap: () {
                Navigator.pushNamed(context, '/menuAR');
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
            )
          ],
        ),
      ),
    );
  }
}
