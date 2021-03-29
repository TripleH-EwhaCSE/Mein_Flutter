import 'package:flutter/material.dart';
import 'package:mein/bottomnavigationbar.dart';

class MenuDetail extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
    Widget menuSection(String menunameko, String menunameeng) {
      return Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 32.0),
                    child: Text(menunameko,
                        style: TextStyle(
                          fontSize: 25.0,
                        )),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 14.0),
                child: Text(menunameeng,
                    style: TextStyle(
                      fontSize: 15.0,
                    )),
              ),
              Container(margin: EdgeInsets.only(top: 10.0), child: stars),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonBar(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 190.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/menuAR');
                          },
                          child: Text("AR"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(),
                        child: SizedBox(
                          child: ElevatedButton(
                            child: Text('Add to cart',
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                            onPressed: () {
                              Navigator.pushNamed(context, '/cart');
                            },
                          ),
                          width: 150.0,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ));
    }

    //영양소 설명부분
    Widget textSection(String title, {double width, double height}) {
      return Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 15.0, color: Colors.black),
          ),
        ),
      );
    }

    //return MaterialApp(
    return Scaffold(
      appBar: AppBar(
        title: Text('menudetail'),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: menuSection(
                  "전주 콩나물 국밥", "steamed rice mixed with bean sprout soup"),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: textSection(
                  '** Each restaurant may have different ingredients.'),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Center(
                child: Text('Ingredient',
                    style: TextStyle(fontSize: 15.0, color: Colors.red)),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(child: Text('Must')),
                        Container(child: Text('b')),
                        Container(child: Text('c')),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(child: Text('Usally')),
                        Container(child: Text('e')),
                        Container(child: Text('f')),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: textSection('** Ask owner for more specific information'),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Center(
                child: Text('Allergy Info',
                    style: TextStyle(fontSize: 15.0, color: Colors.red)),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(child: Text('bean')),
                  Container(child: Text('Egg')),
                  Container(child: Text('c')),
                ],
              ),
            ),
          ],
        ),
      ]),
      //)
      bottomNavigationBar: BottomNavigation(currentTab: 0),
    );
  }
}
