import 'package:flutter/material.dart';

class Camera_1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

Widget textbox = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            child: Text('Take a Picture',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0))),
        Text('or',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        Container(
          child: Text(
            'Select a Picture',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
          ),
        ),
        // Image(image: ),
      ]))
    ],
  ),
);
