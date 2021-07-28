import 'package:flutter/material.dart';
//import 'package:mein/bottomnavigationbar.dart';

class RestaurantDetail extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
        title: Text('menudetail')
        ),
         body: SizedBox.expand(
           child:ListView(
          children:<Widget>[
            imageSection,
            menuSection,
            devider,
            restaurantSection
            ]
          ),
        ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    //bottomNavigationBar: BottomNavigation(currentTab : 0),
    );
  }
}

Widget imageSection = Container(
  width: double.infinity,
  //child:Image.asset('images/restaurant_sample.png',fit: BoxFit.cover),
);

Widget menuSection = Container(
  padding: const EdgeInsets.all(36),
  child: Row(
    children: [
      Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[ 
          Container(
            margin: const EdgeInsets.only(top: 12.0),
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
            margin: const EdgeInsets.all(12.0),
            child: Text(
              'Main Menu',
              style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14.0
              ),
            ),
          ),
          Container(
            //child: Image.asset('images/kongnamulgookbab.png'),
          ),
          Container(
          margin: const EdgeInsets.only(top:12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Container(
                child:Text(
                '#HOT',
                style : TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.0
                )
              )
              ),
              Container(
                margin: const EdgeInsets.only(left: 36.0),
                child:Text(
                '#SALTY',
                style : TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.0
                )
              )
              ),
              Container(
                margin: const EdgeInsets.only(left: 36.0),
                child:Text(
                '#VEGAN',
                style : TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.0
                )
              )
              )
            ]
          )
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
 padding: const EdgeInsets.all(36),
  child: Row(
    children: [
      Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Container(
            margin: const EdgeInsets.only(bottom:12.0),
            child:Text(
              'This restaurant is ...',
              style : TextStyle(
                 fontWeight: FontWeight.normal,
                 fontSize: 16.0
              )
            )
          ),
          stars,
          Container(
            margin: const EdgeInsets.only(top:12.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              Container(
                child :Text(
                  '#Cheap',
                  style : TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0
                  )
                )
              ),
              Container(
                margin: const EdgeInsets.only(left: 36.0),
                child :Text(
                  '#Delicious',
                  style : TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0
                )
              )),
              Container(
                margin: const EdgeInsets.only(left: 36.0),
                child :Text(
                  '#Kind',
                  style : TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0
                )
              ))
            ]
          )
          )
        ]
      )
      )
    ]
  )
);

Widget devider = Container(
  height: 2.0,
  width: double.infinity,
  color: const Color(0xFFC4C4C4),
  margin: const EdgeInsets.only(left:24.0,right: 24.0),
);