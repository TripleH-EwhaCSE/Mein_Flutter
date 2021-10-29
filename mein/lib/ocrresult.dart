import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mein/menudetail.dart';
import 'dart:convert' show jsonDecode, utf8;

import 'menuList.dart';

import 'package:get/get.dart';

class ocrresult extends StatefulWidget {
  @override
  _FlaskApiState createState() => _FlaskApiState();
}

class _FlaskApiState extends State<ocrresult> {
  GlobalKey _imageKey, _bg = GlobalKey();
  double _x, _y;

  static const String GOORM_IO = "http://34.64.248.143:8000/";
  var data;
  List<dynamic> list = [];
  List<dynamic> size = [];

  @override
  void initState() {
    Future.microtask(() async {
      var res = await http.get(GOORM_IO);
      final decodeData = utf8.decode(res.bodyBytes);
      data = jsonDecode(decodeData);
      for (var i = 0; i < data["result"].length; i++) {
        list.add(data["result"][i]);
      }
      for (var k = 0; k < data["size"].length; k++) {
        size.add(data["size"][k]);
      }
      //data = res.body;
      print(data);
      //print(list[0]);
      setState(() {});
    });
    super.initState();
  }

  void _click() {
    print("success!!]");
    print('Height is ${context.size.height}');
    print('Width is ${context.size.width}');
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    Foodinfo food;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: Image.asset('images/MeIN.png'),
      //   centerTitle: true,
      //   elevation: 0.0,
      // ),
      body: Container(
        child: Stack(
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
                          //color: Colors.green,
                          //shape: BoxShape.rectangle,
                          image: DecorationImage(
                        image: MemoryImage(args),
                        fit: BoxFit.contain,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.dstATop),
                      )))),
              for (var j = 0; j < list.length; j++)
                // list[j][0] = foodName_KR,
                // list[j][1] = foodName_Eng;
                Positioned(
                    top: (screenHeight - size[1] * screenWidth / size[0]) / 2 +
                        (list[j][2][0][1] / size[1]) *
                            size[1] *
                            screenWidth /
                            size[0] -
                        5, //200+(110/768)*screenHeight,
                    left: list[j][2][0][0] / size[0] * screenWidth,
                    child: FlatButton(
                        child: Text(
                          list[j][1].toString(),
                          style: TextStyle(fontSize: 15.0),
                        ),
                        onPressed: () => {
                              // Navigator.pushNamed(context, '/menuname',
                              //     arguments: Foodinfo(list[j][0].toString(),
                              //         list[j][1].toString()))
                              food = Foodinfo(
                                  list[j][0].toString(), list[j][1].toString()),
                              // await Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           MenuDetailPage(food: food)),
                              //);

                              // Get.to(MenuDetail(), arguments: "abc")

                              Navigator.pushNamed(context, '/menudetail',
                                  arguments: food)

                              // Foodinfo(
                              //     foodnameKR: list[j][0],
                              //     foodnameENG: list[j][1])
                              //     )
                            })),
              // Positioned(
              //     top: (screenHeight - 768 * screenWidth / 1024) / 2+ (110 / 768) * 768 * screenWidth / 1024, //200+(110/768)*screenHeight,
              //     left: 344 / 1024 * screenWidth,
              //     child: FlatButton(
              //       child: Text(list[0][1].toString()),
              //       onPressed: () => _click,
              //     )),
              // Positioned(
              //     top: (screenHeight - 768 * screenWidth / 1024) / 2 + (226 / 768) * 768 * screenWidth / 1024, //50+(screenHeight-1024*screenWidth/768)/2+(226/768)*screenHeight,
              //     left: 386 / 1024 * screenWidth,
              //     child: FlatButton(
              //       child: Text(list[1][1].toString()),
              //       onPressed: _click,
              //     ))
            ]),
      ),

      //bottomNavigationBar: BottomNavigation(currentTab: 0),
    );
  }
}

class Foodinfo {
  String foodnameKR;
  String foodnameENG;

  Foodinfo(this.foodnameKR, this.foodnameENG);
}
