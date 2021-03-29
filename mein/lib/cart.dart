import 'package:flutter/material.dart';
import 'package:mein/bottomnavigationbar.dart';

// ignore: must_be_immutable
class Cart extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('cart')),
      body: SizedBox.expand(
        child: ListView(children: <Widget>[
          SelectedMenu("1.steamed rice mixed with bean sprout soup"),
          MyCart("1.steamed rice mixed with bean sprout soup"),
          Total(9000),
        ]),
      ),
      bottomNavigationBar: BottomNavigation(currentTab: 0),
    );
  }

  Widget value(var value) {
    return Container(
      child: Text(
        '${value}',
        style: TextStyle(fontSize: 16.0),
      ),
      padding: EdgeInsets.only(top: 10.0),
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
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        //  padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: counter(),
              padding: EdgeInsets.only(top: 10.0),
            ),
            Container(
              child: Text('\$'),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(top: 10.0),
            ),
            Container(
              child: value(45),
              alignment: Alignment.centerRight,
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(),
        child: SizedBox(
          child: ElevatedButton(
            child: Text(
              'Add to cart',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.yellow, // background
              // onPrimary: Colors.white, // foreground
            ),
            onPressed: () {},
            /*decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),*/
          ),
          width: 150.0,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(top: 10.0, right: 20.0),
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
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: counter(),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(top: 10.0),
            ),
            Container(
              child: Text('\$'),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(top: 10.0),
            ),
            Container(
              child: value(45),
              alignment: Alignment.centerRight,
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(),
        child: SizedBox(
          child: ElevatedButton(
            child: Text('Pay',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                )),
            style: ElevatedButton.styleFrom(
              primary: Colors.yellow, // background
              // onPrimary: Colors.white, // foreground
            ),
            onPressed: () {},
          ),
          width: 150.0,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(top: 10.0, right: 20.0),
      ),
    ]);
  }

  // ignore: non_constant_identifier_names
  Widget Total(var won) {
    var dollarInt = won / 1220;
    var dollar = dollarInt.toStringAsFixed(2);
    return Flex(direction: Axis.vertical, children: <Widget>[
      Row(
        children: [
          Container(
            child: Text(
              "Total",
              style: TextStyle(fontSize: 25.0, color: Colors.black),
              textAlign: TextAlign.start,
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10.0),
          ),
          Container(
            child: value(won),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 60.0, left: 10.0),
          ),
          Container(
            child: Text(
              'won',
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 70.0, left: 10.0),
          ),
          Container(
            child: Image.asset('images/arrow.png'),
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 70.0, left: 10.0),
          ),
          Container(
            child: Text(
              '\$',
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 70.0, left: 10.0),
          ),
          Container(
            child:  Text(
              '${dollar}',
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 60.0, left: 10.0),
          ),
        ],
      ),
    ]);
  }
}

// ignore: camel_case_types
class counter extends StatefulWidget {
  @override
  counterstate createState() => counterstate();
}

// ignore: camel_case_types
class counterstate extends State<counter> {
  @override
  var quantity = 0;
  Widget quatityButton() {
    if (quantity < 0) {
      this.quantity = 0;
    }
    return Container(
        // build 메서드는 항상 위젯을 반환한다.
        child: Row(
      children: [
        IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              setState(() {
                // 사용자의 동작을 감지하는 버튼 위젯의 내장 프로퍼티
                this.quantity--; // 상태에 저장된 수량을 감소시킨다
              });
            }),
        new Text("${this.quantity}"), //상태 객체의 수량이 바뀌면 트리의 위젯을 다시 그린다.
        new IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // 이 콜백이 상태의 수량을 증가시키는 setState를 호출한다
              setState(() {
                this.quantity++;
              });
            }),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: quatityButton(),
    );
  }
}