import 'package:flutter/material.dart';
import 'package:boop_app/SplashScreen.dart';


void main() {
  runApp(BoopApp());
}

class BoopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,      //so that the debug banner on the top right corner doesn't show
      theme: ThemeData(fontFamily: 'LibreBaskerville'),
      home: SplashScreen(),
    );
  }
}
