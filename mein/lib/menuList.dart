import 'package:flutter/material.dart';
import 'package:mein/bottomnavigationbar.dart';

class MenuList extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //decoration 을 준다.
          image: DecorationImage(
              image: AssetImage("images/menu_sample.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text('menuList')),
        body: SizedBox.expand(
          child: menuSection(),
        ),
        bottomNavigationBar: BottomNavigation(currentTab: 0),
      ),
    );
  }
}

Widget menuname(String menuname, BuildContext context) {
  // ignore: deprecated_member_use
  return FlatButton(
    child: Text(menuname, style: TextStyle(fontSize: 20)),
    onPressed: () {
      // Navigator.pushNamed(
      //   context,
      //   '/menudetail',
      // );
      Navigator.pushNamed(context, menuSection.routeName,
          arguments: MainMenuArguments(menuname));
    },
    color: Colors.yellow,
    textColor: Colors.black,
  );
}

class MainMenuArguments {
  final String menuname;
  MainMenuArguments(this.menuname);
}

class menuSection extends StatelessWidget {
  static const routeName = '/menudetail';

  Widget build(BuildContext context) {
    final MainMenuArguments args = ModalRoute.of(context).settings.arguments;

    return Container(
        padding: const EdgeInsets.all(36),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              height: 46.0,
              width: 202.0,
              color: Colors.transparent,
              child: new Container(
                padding: const EdgeInsets.all(5),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(4.0),
                      topRight: const Radius.circular(4.0),
                      bottomLeft: const Radius.circular(4.0),
                      bottomRight: const Radius.circular(4.0),
                    )),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('images/ic_location.png'),
                      Flexible(
                          child: new Text(
                              '24/7 steamed rice mixed with bean sprout soup',
                              style: TextStyle(fontSize: 12)))
                    ]),
              )),
          SizedBox(
            height: 48,
          ),
          Container(
            child: Row(children: [
              Expanded(
                  child: Column(children: <Widget>[
                // ignore: deprecated_member_use
                menuname("kongnamul", context),
                SizedBox(
                  height: 72,
                ),
                // ignore: deprecated_member_use
                menuname("bulgogi", context),
                SizedBox(
                  height: 72,
                ),
                // ignore: deprecated_member_use
                menuname("hwangtae", context),
              ])),
              Expanded(
                  child: Column(children: <Widget>[
                // ignore: deprecated_member_use
                menuname("squeeze", context),
                SizedBox(
                  height: 72,
                ),
                // ignore: deprecated_member_use
                menuname("dduck", context),
                SizedBox(
                  height: 72,
                ),
                // ignore: deprecated_member_use
                menuname("kimchizzim", context),
              ])),
            ]),
          )
        ]));
  }
}
