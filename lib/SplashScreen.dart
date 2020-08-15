import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';




class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash>
{

  final int DELAY_SECONDS=3;


  void wait()async
  {
    await Future.delayed(Duration(seconds: DELAY_SECONDS), (){});

    Navigator.pushNamed(context, "/");
  }

  @override
  void initState()
  {
    super.initState();
    wait();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Color(0xff622F74),
              gradient: LinearGradient(
                colors:  [Color(0xff6094e8), Color(0xffde5cbc)],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
            child: SizedBox(),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: <Widget>[
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 50,


                            child: Icon(
                              MdiIcons.dog,
                              color: Colors.cyan,
                              size: 50,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top:50),
                          ),

                          Text(
                            "bOop",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                                fontFamily: 'LibreBaskerville',
                            ),
                          ),

                          Text(
                            "\nWho's a good boi?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),
                          )

                        ],
                      ),
                    ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}