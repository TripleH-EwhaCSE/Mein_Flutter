import 'package:flutter/material.dart';
import 'package:mein/bottomnavigationbar.dart';

class Camera_1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera Page')),
      body: SizedBox.expand(
        child: ListView(children: <Widget>[textbox]),
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      bottomNavigationBar: BottomNavigation(currentTab: 0),
    );
  }
}

Widget textbox = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          child: Text(
            'Take a Picture',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
        ),

        Text(
          'or',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
          textAlign: TextAlign.center,
        ),

        Container(
          child: Text(
            'Select a Picture',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
        ),
        // Image(image: ),
      ]))
    ],
  ),
);
