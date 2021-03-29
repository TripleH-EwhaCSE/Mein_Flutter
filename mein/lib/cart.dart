import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cart extends StatelessWidget {
  get children => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('cart')),
      body: SizedBox.expand(
        child: ListView(children: <Widget>[
          SelectedMenu("1.steamed rice mixed with bean sprout soup"),
          MyCart("1.steamed rice mixed with bean sprout soup")
        ]),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget SelectedMenu(String selectedmenu) {
    return Flex(direction: Axis.vertical, children: <Widget>[
      Container(
        child: Text(
          "Selected Menu",
          style: TextStyle(fontSize: 25.0, color: Colors.black),
          textAlign: TextAlign.start,
        ),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 70.0, left: 10.0),
      ),
      Container(
        child: Text(
          selectedmenu,
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 10.0, left: 20.0),
      ),
      Container(
        margin: EdgeInsets.only(),
        child: SizedBox(
          child: ElevatedButton(
            child: Text(
              'Add to cart',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            onPressed: () {},
            /*decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),*/
          ),
          width: 150.0,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(top: 10.0, right: 50.0),
      ),
    ]);
  }

  // ignore: non_constant_identifier_names
  Widget MyCart(String AddtoCart) {
    return Flex(direction: Axis.vertical, children: <Widget>[
      Container(
        child: Text(
          "My Cart",
          style: TextStyle(fontSize: 25.0, color: Colors.black),
          textAlign: TextAlign.start,
        ),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 10.0, left: 10.0),
      ),
      Container(
        child: Text(
          AddtoCart,
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 10.0, left: 20.0),
      ),
      Container(
        margin: EdgeInsets.only(),
        child: SizedBox(
          child: ElevatedButton(
            child: Text('Pay',
                style: TextStyle(
                  fontSize: 15.0,
                )),
            onPressed: () {},
          ),
          width: 150.0,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(top: 10.0, right: 50.0),
      ),
    ]);
  }

  // ignore: non_constant_identifier_names
  Widget Total(String selectedmenu) {
    return Flex(direction: Axis.vertical, children: <Widget>[
      Container(
        child: Text(
          "Total",
          style: TextStyle(fontSize: 25.0, color: Colors.black),
          textAlign: TextAlign.start,
        ),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 70.0, left: 10.0),
      ),
      Container(
        child: Text(
          selectedmenu,
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 10.0, left: 20.0),
      ),
      Container(
        margin: EdgeInsets.only(),
        child: SizedBox(
          child: ElevatedButton(
            child: Text(
              'Add to cart',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            onPressed: () {},
            /*decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),*/
          ),
          width: 150.0,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(top: 10.0, right: 50.0),
      ),
    ]);
  }
}
