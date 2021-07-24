import 'package:flutter/material.dart';
import 'package:mein/bottomnavigationbar.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vertical_barchart/extension/expandedSection.dart';
import 'package:vertical_barchart/vertical-barchart.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';
import 'package:vertical_barchart/vertical-legend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuDetailPage(),
    );
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
          appBar: AppBar(title: Text('menudetail')),
          body: Column(children: <Widget>[
            imageSection,
            menuSection,
            // the tab bar with two items
            SizedBox(
              height: 50,
              child: AppBar(
                bottom: TabBar(
                  tabs: 
                  [
                    Tab(
                        child: Text('Ingredient',
                            style: TextStyle(
                                fontFamily: "Sans",
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0))),
                    Tab(
                        child: Text('Review',
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
                      child:  ReviewList()
                          ),
                ],
              ),
            ),

            // devider,
            // restaurantSection
          ]),
          // home: MyHomePage(title: 'Flutter Demo Home Page'),
          bottomNavigationBar: BottomNavigation(currentTab: 0),
        ));
  }
}

Widget imageSection = Container(
  height: 50,
  width: double.infinity,
  child: Image.asset('images/restaurant_sample.png', fit: BoxFit.cover),
);
// Food food = Firestore.instance
//     .collection('foodingredient')
//     .where('foodnameKR', isEqualTo: food.foodnameKR)
//     .getDocuments().then((QuerySnapshot ds) {
//       print(ds.documents.length);
Food food = new Food('콩나물 국밥','steamed rice mixed with bean sprout soup');
Widget menuSection = Container(
  height: 300,
  padding: const EdgeInsets.all(36),
  child: Row(
    children: [
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
            margin: const EdgeInsets.only(top: 12.0),
            child: Text(food.foodnameKR,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0))),
        Text(food.foodnameENG,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0)),
        Container(
          margin: const EdgeInsets.all(12.0),
          child: Text(
            'Main Menu',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.0),
          ),
        ),
        Container(
          child: Image.asset('images/kongnamulgookbab.png'),
        ),
        stars,
        Container(
            margin: const EdgeInsets.only(top: 12.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  child: Text('#HOT',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16.0))),
              Container(
                  margin: const EdgeInsets.only(left: 36.0),
                  child: Text('#SALTY',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16.0))),
              Container(
                  margin: const EdgeInsets.only(left: 36.0),
                  child: Text('#VEGAN',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16.0)))
            ]))
      ]))
    ],
  ),
);

class Food {
  String foodnameKR;
  String foodnameENG;

  Food(this.foodnameKR, this.foodnameENG);
}

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
    child: Row(children: [
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: Text('This restaurant is ...',
                style:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0))),
        stars,
        Container(
            margin: const EdgeInsets.only(top: 12.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  child: Text('#Cheap',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16.0))),
              Container(
                  margin: const EdgeInsets.only(left: 36.0),
                  child: Text('#Delicious',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16.0))),
              Container(
                  margin: const EdgeInsets.only(left: 36.0),
                  child: Text('#Kind',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16.0)))
            ]))
      ]))
    ]));

class MyBarchart extends StatelessWidget{
  @override
  List<VBarChartModel> bardata = [];
  Widget build(BuildContext context){
    //allergy.forEach((item) => Text(item));
    return StreamBuilder<QuerySnapshot>(
      stream:Firestore.instance.collection('foodingredient').where('foodnameKR', isEqualTo: food.foodnameKR).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        final document = snapshot.data.documents;
          print(document);
          bardata = [];
          for (var ingredient in document[0].data["ingredient"]){
          bardata.add(VBarChartModel(
                        index: 1,
                        label: ingredient["name"],
                        colors: (ingredient["isvegan"])?[Colors.teal, Colors.indigo] :[Colors.orange, Colors.deepOrange] ,
                        jumlah: (ingredient["percent"]/100)*55,
                        tooltip: ingredient["percent"].toString()+"%",
                    ));
          }
          return Scaffold(
            body: SingleChildScrollView(
                child: Column(
              children: [
                _buildGrafik(bardata),
                IngredientList,
                IngredientinfoList,
              ],
            )),
          );
        }
    );
  }
  Widget _buildGrafik(List<VBarChartModel> bardata){
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
          color: Colors.orange,
          text: "Non-Vegan",
        ),
        Vlegend(
          isSquare: false,
          color: Colors.teal,
          text: "Vegan",
        )
      ],
    );
  }
}

Widget reviewView = Container(
  height: 2.0,
  width: double.infinity,
  color: const Color(0xFFC4C4C4),
  margin: const EdgeInsets.only(left: 24.0, right: 24.0),
);

Widget reviewWrite = Container(
  width: 200.0,
  // height: 230.0,
  child : RatingDialog(
  submitButton: 'Submit',
  //onCancelled: () => print('cancelled'),
  onSubmitted: (response) {
    Firestore.instance.collection("foodreview").add({
      "foodnameENG": food.foodnameENG,
      "foodnameKR": food.foodnameKR,
      "review": '${response.comment}',
      "star": int.parse('${response.rating}'),
      "uploaddate": Timestamp.now(),
    }).then((value) => MenuDetail());
  }, 
  title: 'Write your own review',
));



class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List <Widget> list = [];
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("foodreview").where('foodnameKR', isEqualTo: food.foodnameKR).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          final document = snapshot.data.documents;
          list = [reviewWrite];
          for (var element in document){
            list.add( Card(
              elevation: 2,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
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

class Reviews {
  int score;
  String reviewText;

   Reviews(this.score, this.reviewText);
}

class ReviewsTile extends StatelessWidget{
  ReviewsTile(this._reviews);
  final Reviews _reviews;
  @override
  Widget build(BuildContext context) {
     return ListTile(
      leading: Icon(Icons.person),
      title: StarIcon(_reviews.score),
      subtitle: Text("${_reviews.reviewText}"),
    );
  }
}

class StarIcon extends StatelessWidget{
  StarIcon(this._score);
  final int _score;
  @override
  Widget build(BuildContext context) {
     switch (_score){
     case 1:  
     return Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.grey),
    Icon(Icons.star, color: Colors.grey),
    Icon(Icons.star, color: Colors.grey),
    Icon(Icons.star, color: Colors.grey),
  ],
);
     case 2:  
     return Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.grey),
    Icon(Icons.star, color: Colors.grey),
    Icon(Icons.star, color: Colors.grey),
  ],
);
     case 3:  
     return Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.grey),
    Icon(Icons.star, color: Colors.grey),
  ],
);
     case 4:  
     return Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.grey),
  ],
);
     case 5:  
     return Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.yellow[500]),
    Icon(Icons.star, color: Colors.yellow[500]),
  ],
);
     }
    // TODO: implement build
    throw UnimplementedError();
  }
}

Widget devider = Container(
  height: 2.0,
  width: double.infinity,
  color: const Color(0xFFC4C4C4),
  margin: const EdgeInsets.only(left: 24.0, right: 24.0),
);


Widget IngredientList =  Container(
          margin: const EdgeInsets.only(top: 12.0),
            child: Text('Allergy Info',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)));

Widget IngredientinfoList = Container(
    margin: const EdgeInsets.only(top: 12.0),
    height: 100.0,
    child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[Ingredientinfo()]));

class Ingredientinfo extends StatelessWidget {
  @override
  List<String> allergy = [];
  Widget build(BuildContext context){
    //allergy.forEach((item) => Text(item));
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("foodingredient").where('foodnameKR', isEqualTo: food.foodnameKR).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        final document = snapshot.data.documents;
          print(document);
          allergy = [];
            for (var element in document[0].data["allergy"]){
              print(element);
              allergy.add(element);
            }
          return Container(
            width: 350.0,
            height: 300.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: allergy.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 12.0),
                    child:Text('${allergy[index]}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                  );
                },
              )
            );
          }
        );
  }
}