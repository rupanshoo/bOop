import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


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
                fontSize: 20.0,
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
              return ListView.builder(

                itemBuilder: (BuildContext context, int index){

                  return Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff622F74),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 50,
                      child: Row(
                        children: <Widget>[
                          Text(
                            "  " + myData[index]['name'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.pets, color: Colors.cyan),
                          Padding(
                            padding: EdgeInsets.only(top:50, bottom: 50),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: myData.length,
              );
            }, future: DefaultAssetBundle.of(context).loadString('json_data/boopNames.json')

          ),
        ),
      ),
    );
  }
}


