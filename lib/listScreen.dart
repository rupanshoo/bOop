import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:boop_app/NamedList.dart';
import 'List.dart';


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

List data;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: new Container(
        child: Center(
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString('json_data/boopNames.json'),
              builder: (context, snapshot) {
                List<NamedList> doggoNames = parseJosn(
                    snapshot.data.toString());
                return !doggoNames.isEmpty ? new BoopList(BoopName: doggoNames) : new Center (child: CircularProgressIndicator());
              },
          ),
        ),
      ),
    );
  }



  List<NamedList> parseJosn(String response){
    if(response == null){
      return[];
    }
    final parsed = json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<NamedList>((json) => new NamedList.fromJson(json)).toList();
  }

}


