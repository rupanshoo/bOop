import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:boop_app/homeScreen.dart';
import 'package:boop_app/infoScreen.dart';
import 'package:boop_app/listScreen.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  int _index = 0;
  //final List<Widget> _children = [PlaceholderWidget(), PlaceholderWidget(), PlaceholderWidget()];
  final List<Widget> _widget = [
    homeScreen() ,
    listScreen(),
    infoScreen()
  ];
  void tapped(int tappedIndex){
    setState(() {
      _index = tappedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children : [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background1.jpg'),
                fit: BoxFit.cover,
              )
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: _widget[_index],
          bottomNavigationBar:  CurvedNavigationBar(      //CURVED BAR NAVIGATION
            onTap: tapped,
            index: _index,  //this will be set when a new tab is opened
            buttonBackgroundColor: Colors.white,  //background color of the button
            color: Colors.transparent,   //foreground color of the bar
            backgroundColor: Colors.cyan,
            height: 50.0,   //height of bar
            items: <Widget>[
              Icon(Icons.home, size: 30, color: Color(0xff622F74) ,),   //colour here is colour of the symbol on the button
              Icon(Icons.list, size: 30, color: Color(0xff622F74),),
              Icon(MdiIcons.fromString('dog'), size: 30, color: Color(0xff622F74),),
            ],
          ),

        ),
      ], //children
    );
  }
}

