import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget{

  BottomNavigation({@required this.currentTab});
  int currentTab = 0;
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
         showSelectedLabels: false,  
        showUnselectedLabels: false,
      items: [ 
          new BottomNavigationBarItem( 
            icon: Image.asset("images/ic_map.png", width: 60, height: 60), 
            // ignore: deprecated_member_use
            title: new Text('map'),
          ),
          new BottomNavigationBarItem( 
            icon: Image.asset("images/ic_camera.png", width: 60, height: 60), 
          // ignore: deprecated_member_use
            title: new Text('camera'),
          ), 
            new BottomNavigationBarItem( 
            icon: Image.asset("images/ic_gallery.png", width: 60, height: 60), 
         // ignore: deprecated_member_use
            title: new Text('gallery'),
          ), 
        ], 
      onTap: (index){
          switch(index){
              case 0:
                Navigator.pushNamed(context, "/menudetail");
                break;
              case 1:
                Navigator.pushNamed(context, "/menuAR");
                break;
              case 2:
                Navigator.pushNamed(context, "/map");
                break;
            }
      }
    );
  }
}