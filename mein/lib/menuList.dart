import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration( //decoration 을 준다.
              image: DecorationImage(
                image: AssetImage("images/menu_sample.png"), fit: BoxFit.cover)
                ),
      child:Scaffold(
          backgroundColor: Colors.transparent, 
          appBar:AppBar(
            title: Text('menuList')
            ),
            body: SizedBox.expand(
                child :menuSection,
              ),
    ),
    );
  }
}


Widget menuSection = Container(
  padding: const EdgeInsets.all(36),
  child:Column(
        children:[
           Container(
            height: 46.0,
            width: 202.0,
            color: Colors.transparent,
            child: new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(4.0),
                  topRight: const Radius.circular(4.0),
                  bottomLeft: const Radius.circular(4.0),
                  bottomRight: const Radius.circular(4.0),
                )
              ),
              child: Row(
                children:[
                  Image.asset('images/ic_location.png'),
                  Text('24/7 steamed rice mixed with bean sprout soup', 
                  style: TextStyle(fontSize: 12
                  ))
                ]
              ),
            )
          ),
          SizedBox(
                  height: 48,
                ),
      Container(
        child: Row(
          children:[
            Expanded(child:Column(
              children: <Widget>[
                // ignore: deprecated_member_use
                FlatButton(
                  child: Text('콩나물국밥', style: TextStyle(fontSize: 24)),
                  // onPressed: () => showMessage('FlatButton'),
                  onPressed: () {  },
                  color: Colors.yellow,
                  textColor: Colors.black, 
                ),
                SizedBox(
                  height: 72,
                ),
                // ignore: deprecated_member_use
                FlatButton(
                    child: Text('황태콩나물국밥', style: TextStyle(fontSize: 24)),
                    // onPressed: () => showMessage('FlatButton'),
                    onPressed: () {  },
                    color: Colors.yellow,
                    textColor: Colors.black, 
                ),
                SizedBox(
                  height: 72,
                ),
                  // ignore: deprecated_member_use
                FlatButton(
                    child: Text('김치콩나물국밥', style: TextStyle(fontSize: 24)),
                    // onPressed: () => showMessage('FlatButton'),
                    onPressed: () {  },
                    color: Colors.yellow,
                    textColor: Colors.black, 
                  )
                ]
              )
            ),
            Expanded(child:Column(
              children: <Widget>[
                // ignore: deprecated_member_use
                  FlatButton(
                      child: Text('부추야채전', style: TextStyle(fontSize: 24)),
                      // onPressed: () => showMessage('FlatButton'),
                      onPressed: () {  },
                      color: Colors.yellow,
                      textColor: Colors.black, 
                    ),
                  SizedBox(
                    height: 72,
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                      child: Text('김치전', style: TextStyle(fontSize: 24)),
                      // onPressed: () => showMessage('FlatButton'),
                      onPressed: () {  },
                      color: Colors.yellow,
                      textColor: Colors.black, 
                    ),
                  SizedBox(
                    height: 72,
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                      child: Text('오징어한마리', style: TextStyle(fontSize: 24)),
                      // onPressed: () => showMessage('FlatButton'),
                      onPressed: () {  },
                      color: Colors.yellow,
                      textColor: Colors.black, 
                    )
                  ]
                ) 
              ),
            ]
          ),
      ) 
      ]
    )
);
      