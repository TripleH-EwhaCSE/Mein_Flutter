import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

void openPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Second page'),
        ),
        body: const Center(
          child: Text(
            'This is the Second page',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    },
  ));
}

class camera_3 extends StatelessWidget {
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('AppBar Example'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next page',
            onPressed: () {
              openPage(context);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'This is my first page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
    return Column(
      children: <Widget>[
        makeRow('/Users/ohjoo/Desktop/Mein_Flutter/mein/images/photo.png',
            '/Users/ohjoo/Desktop/Mein_Flutter/mein/images/photo.png'),
        makeRow('/Users/ohjoo/Desktop/Mein_Flutter/mein/images/photo.png',
            '/Users/ohjoo/Desktop/Mein_Flutter/mein/images/photo.png'),
        makeRow('/Users/ohjoo/Desktop/Mein_Flutter/mein/images/photo.png',
            '/Users/ohjoo/Desktop/Mein_Flutter/mein/images/photo.png'),
      ],
    );
  }

  Widget makeRow(String leftPath, String rightPath) {
    return IntrinsicHeight(
      child: Row(
        children: <Widget>[
          makeExpandedImage(leftPath),
          makeExpandedImage(rightPath),
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }

  Widget makeExpandedImage(String imagePath) {
    return Expanded(
      child: Container(
        child: Image.asset(imagePath, fit: BoxFit.cover),
        margin: EdgeInsets.all(5.0),
      ),
    );
  }
}
