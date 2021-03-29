import 'package:flutter/material.dart';
import 'package:mein/bottomnavigationbar.dart';
// MyApp을 시작 위젯으로 설정하여 앱을 실행
//void main() => runApp(MyApp());

class Camera_2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check the Photo')),
      body: Camera_2_1(),
      bottomNavigationBar: BottomNavigation(currentTab: 0),
    );
  }
  // This widget is the root of your application.
}

class Camera_2_1 extends StatefulWidget {
  @override
  State createState() {
    return Camera_2_state();
  }
}

// 앱의 시작점에 해당하는 위젯
class Camera_2_state extends State<Camera_2_1> {
  String selected = 'images/restaurant_sample.png';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.asset(selected, fit: BoxFit.fill),
        ),
        Container(
          child: Align(
            child: Row(
              children: <Widget>[
                makeButton(
                    '다시 시도',
                    () => selected =
                        '/Users/ohjoo/Desktop/Mein_Flutter/mein/images/restaurant_sample.png'),
                makeButton(
                    '확인',
                    () => selected =
                        '/Users/ohjoo/Desktop/Mein_Flutter/mein/images/restaurant_sample.png'),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
            alignment: Alignment.bottomCenter,
          ),
          padding: EdgeInsets.only(bottom: 50),
        ),
      ],
    );
  }

  Widget makeButton(String title, VoidCallback callback) {
    // ignore: deprecated_member_use
    return RaisedButton(
      child: Text(title),
      onPressed: () {
        setState(() => callback());
      },
    );
  }
}
