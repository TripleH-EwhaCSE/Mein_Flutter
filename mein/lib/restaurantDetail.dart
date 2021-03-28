

import 'package:flutter/material.dart';


class RestaurantDetail extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
        title: Text('menudetail')
        ),
         body: ListView(
          children:<Widget>[
              menuSection,
              restaurantSection
            ]
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

var stars = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.grey),
    Icon(Icons.star, color: Colors.grey),
  ],
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
          stars,
          Row(
            children:[
              Text(
                '#Cheap',
                style : TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.0
                )
              ),
              Text(
                '#Delicious',
                style : TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.0
                )
              ),
              Text(
                '#Kind',
                style : TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.0
                )
              )
            ]
          )
        ]
      )
      )
    ]
  )
);
