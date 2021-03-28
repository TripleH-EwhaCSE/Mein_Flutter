import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuAR extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('menuAR')),
      body: Hobby(),
    );
  }
  // This widget is the root of your application.

}

class Hobby extends StatefulWidget {
  @override
  State createState() {
    return HobbyState();
  }
}

class HobbyState extends State<Hobby> {
  String selected = 'images/restaurant_sample.png';
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
                Text('AR',
                    style: TextStyle(fontSize: 25.0, color: Colors.white)),
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
                makeButton('Hot', () => selected),
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
      child: Text(title, style: TextStyle(fontSize: 25.0, color: Colors.white)),
      onPressed: () {},
    );
  }
}

Widget imageSection = Container(
  width: double.infinity,
  height: double.infinity,
  child: Image.asset('images/restaurant_sample.png'),
);
