import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vertical_barchart/vertical-barchart.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';
import 'package:vertical_barchart/vertical-legend.dart';
import 'dart:ui' as ui;

import 'menudetail.dart';

class Owner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Image.asset('images/MeIN.png'),
          centerTitle: true,
          elevation: 0.0,
        ),
        drawer: Drawer(
            child: ListView(children: <Widget>[
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
        ])),
        body: MenuDetailPage());
  }
}

class MenuDetailPage extends StatefulWidget {
  @override
  _MenuDetailState createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetailPage> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(children: <Widget>[
            resNameSection,
            menuSection,
            keywordSection,
            // the tab bar with two items
            SizedBox(
              height: 50,
              child: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(
                        child: Text('메뉴 통계',
                            style: TextStyle(
                                fontFamily: "Sans",
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0))),
                    Tab(
                        child: Text('리뷰 관리',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0))),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    width: 200.0,
                    child: MyBarchart(),
                  ),
                  Container(
                      width: 200.0,
                      // child: reviewWrite
                      child: ReviewList()),
                ],
              ),
            ),

            // devider,
            // restaurantSection
          ]),
          // home: MyHomePage(title: 'Flutter Demo Home Page'),
          //bottomNavigationBar: BottomNavigation(currentTab: 0),
        ));
  }
}

Widget resNameSection = Container(
    height: 130,
    width: 130,
    child: Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Text('Your Restaurant',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),

          Text('옥경식당',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0)),

          // Text('Menu C',
          //     style: TextStyle(
          //         fontWeight: FontWeight.bold, fontSize: 16.0)),
        ],
      )),
    ));

Widget menuSection = Container(
  margin: new EdgeInsets.only(top: 14.0),
  height: 100,
  width: double.infinity,
  child: Image.asset('images/grilledporkbelly_sample.png', fit: BoxFit.cover),
);

Widget keywordSection = Container(
  margin: new EdgeInsets.only(left: 15.0),
  height: 100,
  width: double.infinity,
  child: Scaffold(
    body: SingleChildScrollView(
        child: Column(
      children: [
        Text('키워드 모아보기',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0)),
        Text('#HOT #SALTY #COMFORT #AMAZING #GOOD #SAVORY',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
        Text('#매운 #짠 #편안한 #놀라운 #좋은 #짭짤한',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
      ],
    )),
  ),
);

class MyBarchart extends StatelessWidget {
  @override
  List<VBarChartModel> bardata1 = [];
  List<VBarChartModel> bardata2 = [];
  List<VBarChartModel> bardata3 = [];
  Widget build(BuildContext context) {
    //allergy.forEach((item) => Text(item));
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('foodingredient')
            .where('name', isEqualTo: food.foodnameENG)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //final document = snapshot.data.documents;
          //print(document);
          bardata1 = [];
          bardata1.add(VBarChartModel(
            index: 1,
            label: "긍정",
            colors: [
              Color(0xFF01579B),
              Color(0xFF80D8FF),
            ],
            jumlah: (66 / 100) * 55,
            tooltip: "66%", //ingredient["percent"].toString()+"%",
          ));
          bardata1.add(VBarChartModel(
            index: 2,
            label: "부정",
            colors: [Colors.deepOrange, Color(0xFFDD2C00)],
            jumlah: (34 / 100) * 55,
            tooltip: "34%", //ingredient["percent"].toString()+"%",
          ));
          bardata2 = [];
          bardata2.add(VBarChartModel(
            index: 1,
            label: "긍정",
            colors: [
              Color(0xFF01579B),
              Color(0xFF80D8FF),
            ],
            jumlah: (61 / 100) * 55,
            tooltip: "61%", //ingredient["percent"].toString()+"%",
          ));
          bardata2.add(VBarChartModel(
            index: 2,
            label: "부정",
            colors: [Colors.deepOrange, Color(0xFFDD2C00)],
            jumlah: (29 / 100) * 55,
            tooltip: "29%", //ingredient["percent"].toString()+"%",
          ));
          bardata3 = [];
          bardata3.add(VBarChartModel(
            index: 1,
            label: "긍정",
            colors: [
              Color(0xFF01579B),
              Color(0xFF80D8FF),
            ],
            jumlah: (44 / 100) * 55,
            tooltip: "44%", //ingredient["percent"].toString()+"%",
          ));
          bardata3.add(VBarChartModel(
            index: 2,
            label: "부정",
            colors: [Colors.deepOrange, Color(0xFFDD2C00)],
            jumlah: (55 / 100) * 55,
            tooltip: "55%", //ingredient["percent"].toString()+"%",
          ));
          return Scaffold(
            body: SingleChildScrollView(
                child: Column(
              children: [
                Text('Menu A',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                _buildGrafik(bardata1),
                Text('Menu B',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                _buildGrafik(bardata2),
                Text('Menu C',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                _buildGrafik(bardata3)
              ],
            )),
          );
        });
  }

  Widget _buildGrafik(List<VBarChartModel> bardata) {
    return VerticalBarchart(
      maxX: 55,
      data: bardata,
      showLegend: true,
      showBackdrop: true,
      barStyle: BarStyle.DEFAULT,
      // alwaysShowDescription: true,
      legend: [
        Vlegend(
          isSquare: false,
          color: Color(0xFF01579B),
          text: "Positive",
        ),
        Vlegend(
          isSquare: false,
          color: Color(0xFFDD2C00),
          text: "Negative",
        ),
      ],
    );
  }
}

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("foodreview")
            .where('foodnameKR', isEqualTo: food.foodnameKR)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          final document = snapshot.data.documents;
          //list = [reviewWrite()];
          for (var element in document) {
            list.add(Card(
              elevation: 2,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        StarIcon(element["star"]),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        element["review"],
                        style: TextStyle(color: Colors.black54),
                      ),
                    )
                  ],
                ),
              ),
            ));
          }
          return ListView(children: list);
        });
  }
}
