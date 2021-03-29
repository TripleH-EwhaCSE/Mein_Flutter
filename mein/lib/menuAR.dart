import 'package:flutter/material.dart';
import 'package:mein/bottomnavigationbar.dart';

// ignore: must_be_immutable
class MenuAR extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('menuAR')),
      body: Menu(),
      bottomNavigationBar: BottomNavigation(currentTab: 0),
    );
  }
  // This widget is the root of your application.
}

class Menu extends StatefulWidget {
  @override
  State createState() {
    return MenuState();
  }
}

class MenuState extends State<Menu> {
  String selected = 'images/AR_sample.png';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.asset(selected, fit: BoxFit.fill),
        ),
        Container(
          child: Align(
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    'AR',
                    style: TextStyle(fontSize: 25.0, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      color: Colors.red[400],
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  width: 50.0,
                  height: 40.0,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
            alignment: Alignment.topCenter,
          ),
          padding: EdgeInsets.only(top: 50, left: 300),
        ),
        Container(
          child: Align(
            child: Row(
              children: <Widget>[
                makeButton('HOT', () => selected),
                makeButton('SALTY', () => selected),
                makeButton('VEGAN', () => selected),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
            alignment: Alignment.bottomCenter,
          ),
          padding: EdgeInsets.only(bottom: 50),
        ),
      ],
    );
  }

  Widget makeButton(String title, VoidCallback callback) {
    // ignore: deprecated_member_use
    return TextButton(
      child: Container(
        child: Text(
          title,
          style: TextStyle(fontSize: 25.0, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        padding: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        width: 100.0,
        height: 40.0,
      ),
      onPressed: () {},
    );
  }
}

Widget imageSection = Container(
  width: double.infinity,
  height: double.infinity,
  child: Image.asset('images/AR_sample.png'),
);
