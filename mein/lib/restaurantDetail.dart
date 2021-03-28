import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
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


Widget menuSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Container(
            child:Text(
              '전주 콩나물 국밥',
              style : TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 24.0
              )
            )
          ),
          Text(
            'steamed rice mixed with bean sprout soup',
            style : TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16.0
            )
          ),
          Container(
            child: Text(
              'Main Menu',
              style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14.0
              ),
            ),
          ),
          // Image(image: ),
          Row(
            children:[
              Text(
                '#Hot',
                style : TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.0
                )
              ),
              Text(
                '#Hot',
                style : TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.0
                )
              ),
              Text(
                '#Hot',
                style : TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.0
                )
              )
            ]
          )
        ]
      ))  
    ],
  ),
);

Widget restaurantSection = Container(
 padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Container(
            child:Text(
              'This restaurant is ...',
              style : TextStyle(
                 fontWeight: FontWeight.normal,
                 fontSize: 16.0
              )
            )
          ),
          Row()
        ]
      )
      )
    ]
  )
);