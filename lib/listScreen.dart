import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';



// ignore: camel_case_types
class listScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Center(
            child: Text('bOop Name Suggestions',
              style: TextStyle(
                fontFamily: 'LibreBaskerville',
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ),
          ),
          backgroundColor: Color(0xff622F74),
        ),
        body: Center(
          child: ListViewBuilder(),
        ),
      ),
    );
  }
}



class ListViewBuilder extends StatefulWidget {
  @override
  _ListViewBuilderState createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: new Container(
        child: Center(
          child: FutureBuilder(builder: (context, snapshot) {
              //Decode json
              var myData = json.decode(snapshot.data.toString());
                return AnimationLimiter(
                  child: ListView.builder(

                  itemBuilder: (BuildContext context, int index){

                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: ScaleAnimation(
                        //verticalOffset: 50,
                        child: FadeInAnimation(
                          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent),
                                color: Color(0xff622F74).withOpacity(0.85),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              height: 50,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                      child: Text("  " + myData[index]['name'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(Icons.pets, color: Colors.cyan),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top:50, bottom: 50),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      ),
                    );
                  },
                  itemCount: myData.length,
                ),
                );
            }, future: DefaultAssetBundle.of(context).loadString('json_data/boopNames.json')

          ),
        ),
      ),
    );
  }
}


