import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode, utf8;

import 'bottomnavigationbar.dart';
import 'menuList.dart';

class ocrresult extends StatefulWidget {
  @override
  _FlaskApiState createState() => _FlaskApiState();
}

class MyCanvasPainter extends CustomPainter {
  void paint(Canvas canvas, Size size) {
    // Paint paint = Paint();
    // paint.color = Colors.amber;
    // canvas.drawCircle(Offset(100.0, 200.0), 40.0, paint);
    Paint paintRect = Paint();
    paintRect.color = Colors.lightBlue;
    Rect rect = Rect.fromPoints(Offset(100, 48), Offset(395, 102));
    canvas.drawRect(rect, paintRect);
    Paint paintRect2 = Paint();
    paintRect.color = Colors.amber;
    Rect rect2 = Rect.fromPoints(Offset(398, 48), Offset(499, 102));
    canvas.drawRect(rect2, paintRect2);
  }

  @override
  bool shouldRepaint(MyCanvasPainter oldDelegate) => false;
  //bool shouldRebuildSemantics(MyCanvasPainter oldDelegate) => false;
}

class _FlaskApiState extends State<ocrresult> {
  GlobalKey _imageKey, _bg = GlobalKey();
  double _x, _y;

  static const String GOORM_IO = "https://mein-flask.run.goorm.io/";
  var data;
  List<dynamic> list = [];
  @override
  void initState() {
    Future.microtask(() async {
      var res = await http.get(GOORM_IO);
      final decodeData = utf8.decode(res.bodyBytes);
      data = jsonDecode(decodeData);
      for (var i = 0; i < data["result"].length; i++) {
        list.add(data["result"][i]);
      }
      //data = res.body;
      print(data);
      print(list[0]);
      setState(() {});
    });
    super.initState();
  }

  _getPosition(GlobalKey key) {
    if (key.currentContext != null) {
      final RenderBox renderBox =
          key.currentContext.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      return position;
    }
  }

  void _click() {
    final imagePosition = _getPosition(_imageKey);
    print("success!!]");
    print('Height is ${context.size.height}');
    print('Width is ${context.size.width}');
    //print(${context.size.})
    //print('image posiiton : ${imagePosition.dx} ${imagePosition.dy}');
  }

  void _getOffset(GlobalKey key) {
    RenderBox box = key.currentContext.findRenderObject();
    Offset position = box.localToGlobal(Offset.zero);
    setState(() {
      _x = position.dx;
      _y = position.dy;
    });
    print(_x);
    print(_y);
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body:Container(
    //     child:CustomPaint(
    //     painter: MyCanvasPainter(),
    //   ),
    //   ),
    // );
    final args = ModalRoute.of(context).settings.arguments;
    final screenHeight = MediaQuery.of(context).size.height;
    final minHeight = 400.0;
    final screenWidth = MediaQuery.of(context).size.width;
    final minWidth = 400.0;
    return Scaffold(
      body: Container(
        //key: _imageKey,
        child:
            //Container(
            //               //padding: EdgeInsets.only(top: 100),
            //               key: _imageKey,
            //               height: screenHeight,//screenWidth*1.3,
            //               width: screenWidth,
            //               decoration: BoxDecoration(
            //                     color: Colors.green,
            //                     //shape: BoxShape.rectangle,
            //                     image: DecorationImage(
            //                         image: MemoryImage(args),
            //                         fit:BoxFit.contain
            //                     )
            //                 ),
            Stack(
                //<Widget>
                // for (var j=0;j<list.length;j++) FlatButton(child: Text(list[j][1].toString()),onPressed: _click,),],
                children: [
              Positioned(
                  top: screenWidth / 2,
                  bottom: screenWidth / 2,
                  //alignment: Alignment.bottomCenter,
                  child: Container(
                      key: _bg,
                      height: screenWidth, //screenHeight,//screenWidth*1.3,
                      width: screenWidth,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          //shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: MemoryImage(args),
                            fit: BoxFit.contain,
                          )))),
              Positioned(
                  key: _imageKey,
                  top: 50 +
                      (screenHeight - 1024 * screenWidth / 768) / 2 +
                      (110 / 768) * screenHeight, //200+(110/768)*screenHeight,
                  left: 344 / 1024 * screenWidth,
                  child: FlatButton(
                    child: Text(list[0][1].toString()),
                    onPressed: () => _getOffset(_imageKey),
                  )),
              Positioned(
                  top: 50 +
                      (screenHeight - 1024 * screenWidth / 768) / 2 +
                      (226 / 768) *
                          screenHeight, //50+(screenHeight-1024*screenWidth/768)/2+(226/768)*screenHeight,
                  left: 386 / 1024 * screenWidth,
                  child: FlatButton(
                    child: Text(list[1][1].toString()),
                    onPressed: _click,
                  ))
            ]),
      ),

      //bottomNavigationBar: BottomNavigation(currentTab: 0),
    );
  }
}
