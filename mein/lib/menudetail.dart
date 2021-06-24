import 'package:flutter/material.dart';
import 'package:mein/bottomnavigationbar.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vertical_barchart/extension/expandedSection.dart';
import 'package:vertical_barchart/vertical-barchart.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';
import 'package:vertical_barchart/vertical-legend.dart';

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
                  tabs: [
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
                      child: barchart(), 
                          ),
                  Container(
                      width: 200.0,
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
            child: Text('전주 콩나물 국밥',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0))),
        Text('steamed rice mixed with bean sprout soup',
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

// Widget ingredientView = Container(
    
//     margin: EdgeInsets.symmetric(vertical: 20.0),
//     width: 200.0,
//     child:  
//     );

class barchart extends StatelessWidget{
  List<VBarChartModel> bardata = [
    VBarChartModel(
      index: 0,
      label: "Seafood",
      colors: [Colors.orange, Colors.deepOrange],
      jumlah: (97/100)*55,
      tooltip: "97%",
      description: Text(
        "Most selling fruit last week",
        style: TextStyle(fontSize: 10),
      ),
    ),
    VBarChartModel(
      index: 1,
      label: "tofu",
      colors: [Colors.teal, Colors.indigo],
      jumlah: (55/100)*55,
      tooltip: "55%",
    ),
    VBarChartModel(
      index: 2,
      label: "Anchovy Stock",
      colors: [Colors.teal, Colors.indigo],
      jumlah: (99/100)*55,
      tooltip: "99%",
    ),
    VBarChartModel(
      index: 3,
      label: "papper",
      colors: [Colors.teal, Colors.indigo],
      jumlah: (1/100)*55,
      tooltip: "5%",
    ),
    VBarChartModel(
      index: 4,
      label: "egg",
      colors: [Colors.orange, Colors.deepOrange],
      jumlah: (15/100)*55,
      tooltip: "15%",
    ),
    VBarChartModel(
      index: 5,
      label: "green onion",
      colors: [Colors.teal, Colors.indigo],
      jumlah: (30/100)*55,
      tooltip: "30%",
    ),
        VBarChartModel(
      index: 4,
      label: "crab",
      colors: [Colors.orange, Colors.deepOrange],
      jumlah: (15/100)*55,
      tooltip: "15%",
    ),
  ];

  @override
  Widget build(BuildContext context) {
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

// class Ingredientchart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<double> points = [99, 83, 27, 55, 9, 50, 70, 12];

//     List<String> labels = [
//       // 가로축에 적을 텍스트(레이블)
//       "Seafood",
//       "tofu",
//       "Anchovy Stock",
//       "papper",
//       "egg",
//       "green onion",
//       "salt",
//       "crab"
//     ];

//     //return Scaffold(
//     //body:
//     return Row(
//       //children: <Widget>[
//       //Container(
//       //width: 300.0,
//       //height: 200.0,
//       // padding: const EdgeInsets.symmetric(vertical: 8.0),

//       //Expanded(
//       //child: SingleChildScrollView(
//       //child: Container(
//       // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       // child: Row(
//       //height: 200,
//       children: <Widget>[
//         Container(
//           height: 100.0,
//           width: 300.0,
//           child: CustomPaint(
//               size: Size(200, 200),
//               painter: BarChart(
//                   data: points,
//                   labels: labels,
//                   color: Colors.pinkAccent)), // color - 막대 그래프의 색깔
//         )
//       ],
//       //),
//       //))
//       //),
//       // )
//       //]
//       //)
//     );
//   }
// }

// class BarChart extends CustomPainter {
//   Color color;
//   List<double> data = [];
//   List<String> labels = [];
//   double bottomPadding = 0.0;
//   double leftPadding = 0.0;

//   BarChart({this.data, this.labels, this.color = Colors.blue});

//   @override
//   void paint(Canvas canvas, Size size) {
//     List<Offset> coordinates = getCoordinates(size);

//     drawBar(canvas, size, coordinates);
//   }

//   void drawBar(Canvas canvas, Size size, List<Offset> coordinates) {
//     Paint paint = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill
//       ..strokeCap = StrokeCap.round;

//     double barWidthMargin = 5.0; // 막대 그래프가 겹치지 않게 간격을 줌.

//     for (var index = 0; index < coordinates.length; index++) {
//       Offset offset = coordinates[index];
//       // double left = offset.dy;
//       // double right = size.width - 30; // 간격만큼 가로로 이동
//       // double top = offset.dx;
//       // double bottom =
//       //     offset.dx + barWidthMargin; // 텍스트 크기만큼 패딩을 빼줘서, 텍스트와 겹치지 않게 함.
//       double left = offset.dy;
//       double right = size.width - 30; // 간격만큼 가로로 이동
//       double bottom = offset.dx;
//       double top =
//           offset.dx + barWidthMargin; // 텍스
//       Rect rect = Rect.fromLTRB(left, top, right, bottom);
//       canvas.drawRect(rect, paint);
//     }
//   }

//   List<Offset> getCoordinates(Size size) {
//     List<Offset> coordinates = [];

//     double height = size.height - bottomPadding;
//     double minBarHeight = height / data.length;

//     for (var index = 0; index < data.length; index++) {
//       double top = minBarHeight * (index) + bottomPadding; // 그래프의 가로 위치를 정합니다.
//       double normalized = data[index] / 100; // 그래프의 높이가 [0~1] 사이가 되도록 정규화 합니다.
//       double height =
//           size.height - bottomPadding; // x축에 표시되는 글자들과 겹치지 않게 높이에서 패딩을 제외합니다.
//       double right = normalized * height; // 정규화된 값을 통해 높이를 구해줍니다.

//       Offset offset = Offset(top,right);
//       coordinates.add(offset);
//     }

//     return coordinates;
//   }

//   @override
//   bool shouldRepaint(BarChart old) {
//     return old.data != data;
//   }
// }

Widget reviewView = Container(
  height: 2.0,
  // width: double.infinity,
  color: const Color(0xFFC4C4C4),
  margin: const EdgeInsets.only(left: 24.0, right: 24.0),
);

Widget reviewWrite = RatingDialog(
  submitButton: 'Submit',
  //onCancelled: () => print('cancelled'),
  onSubmitted: (response) {
    print('rating: ${response.rating}, comment: ${response.comment}');
  }, 
  title: 'Write your own review',
);


class ReviewList extends StatelessWidget {
  List<Reviews> reviews = [Reviews(1,"good"),Reviews(2,"good22"),Reviews(3,"good33")];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        reviewWrite,
        ReviewsTile(Reviews(1, "good1")),
        ReviewsTile(Reviews(2, "good2")),
        ReviewsTile(Reviews(3, "good3")),
        ReviewsTile(Reviews(4, "good4")),
        ReviewsTile(Reviews(5, "good5")),
        ReviewsTile(Reviews(3, "good6")),
      ],
      // padding: const EdgeInsets.all(8),
      // itemCount: reviews.length + 1,
      // itemBuilder: (BuildContext context, int index) {
      //   return ReviewsTile(reviews[index-1]);
      // },
    );
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
  List<String> allergy = [
      // 알러지 유발 성분 리스트 
      "Seafood",
      "tofu",
      "Anchovy Stock",
      "papper",
      "egg",
      "green onion",
      "salt",
      "crab"
    ];
  Widget build(BuildContext context) {
    //allergy.forEach((item) => Text(item));
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
        ));
  }
}