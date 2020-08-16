import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


// ignore: camel_case_types
class infoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Center(
            child: Text('About bOop',
              style: TextStyle(
                fontFamily: 'LibreBaskerville',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Color(0xff622F74),
        ),
        body: info(),
      ),
    );
  }
}


// ignore: camel_case_types
class info extends StatefulWidget {
  @override
  _infoState createState() => _infoState();
}

// ignore: camel_case_types
class _infoState extends State<info> {

  void _launchEmail(String emailID) async{
    var url = "mailto: $emailID?subject=bOop!!%20&body=Hey%20Dev!";
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'Could not send E-mail!';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              _launchEmail('rupanshoo2000@gmail.com');
            },
            label: Text('Hey Dev!'),
            icon: Icon(Icons.send),
            backgroundColor: Color(0xff622F74),
          ),
        ),


        Center(
          child: Container(
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.only(top: 20, left: 10, bottom: 10, right: 20),
            decoration: BoxDecoration(
              color: Color(0xff622F74),
              borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(3.0, 3.0),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ),
                ]
            ),
            child: Text(
              'Planning on getting a dog?\n'
                  'Know more about your doggo from bOop!\n'
                  "You get access to information about your dog's needs!\n"
                  'bOop also provides you with a plethora of names for your doggie!\n'
                  'This app helps you to get to know your dog better!\n'
                  '\nCompliments or Complaints? Contact the Dev!',
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Color(0xff622F74),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),

      ],
    );
  }
}
