import 'package:flutter/material.dart';
import 'package:mein/bottomnavigationbar.dart';
import 'package:mein/menuList.dart';

class MenuDetail extends StatelessWidget {
  // This widget is the root of your application.
  static const routeName = '/mainMenu';
  @override
  Widget build(BuildContext context) {
    final MainMenuArguments args = ModalRoute.of(context).settings.arguments;

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
                    child: Text(args.menuname.toString(),
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
              Padding(
                padding: const EdgeInsets.only(left: 150.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/menuImage');
                        },
                        child: Text("Image"),
                      ),
                      padding: const EdgeInsets.only(right: 10.0),
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
                        width: 120.0,
                      ),
                    ),
                  ],
                ),
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
                  '\n** Each restaurant may have different ingredients.'),
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
                        Container(child: Text('bean sprout')),
                        Container(child: Text('soy sauce')),
                        Container(child: Text('garlic')),
                        Container(child: Text('anchovy broth')),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(child: Text('Usally')),
                        Container(child: Text('chili powder')),
                        Container(child: Text('salted shrimp')),
                        Container(child: Text('Sesame oil')),
                        Container(child: Text('Kelp')),
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
              child: textSection('\n\n** Ask owner for more specific information'),
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
                  Container(child: Text('Bean')),
                  Container(child: Text('Sesame')),
                  Container(child: Text('Egg')),
                  Container(child: Text('Shrimp')),
                  Container(child: Text('Anchovy')),
                  Container(child: Text('Garlic')),
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

// class MyBarchart extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     return barchart();
//   }
// }

// class barchart extends State<MyBarchart>{
//   var index = 0;
//   List<VBarChartModel> bardata = [];

//   void initState()  {
//     super.initState();
//     getData();
//     //  print(bardata[0].label);
//     }

//   void getData() async{
//     print("initSTATETEETETET");
//     await Firestore.instance
//     .collection('foodingredient')
//     .where('foodnameKR', isEqualTo: food.foodnameKR)
//     .getDocuments().then((QuerySnapshot ds) {
//       print(ds.documents.length);
//       ds.documents.forEach((doc) => 
//         { 
//           for (var ingredient in doc["ingredient"]){
//           bardata.add(VBarChartModel(
//                         index: 1,
//                         label: ingredient["name"],
//                         colors: (ingredient["isvegan"])?[Colors.teal, Colors.indigo] :[Colors.orange, Colors.deepOrange] ,
//                         jumlah: (ingredient["percent"]/100)*55,
//                         tooltip: ingredient["percent"].toString()+"%",
//                     ))
//           }
//         });
//       });
//     print("-=---------------인스턴스 불러씀...!!"); 
//     print(bardata);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // getData();
//     return Scaffold(
//       body: SingleChildScrollView(
//           child: Column(
//         children: [
//           _buildGrafik(bardata),
//           IngredientList,
//           IngredientinfoList,
//         ],
//       )),
//     );
//   }

//   Widget _buildGrafik(List<VBarChartModel> bardata){
//     return VerticalBarchart(
//       maxX: 55,
//       data: bardata,
//       showLegend: true,
//       showBackdrop: true,
//       barStyle: BarStyle.DEFAULT,
//       // alwaysShowDescription: true,
//       legend: [
//         Vlegend(
//           isSquare: false,
//           color: Colors.orange,
//           text: "Non-Vegan",
//         ),
//         Vlegend(
//           isSquare: false,
//           color: Colors.teal,
//           text: "Vegan",
//         )
//       ],
//     );
//   }
// }