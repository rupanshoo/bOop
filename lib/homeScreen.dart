import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';



// ignore: camel_case_types
class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Center(
            child: Text('bOop',
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
          child: grid(),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class grid extends StatefulWidget {
  @override
  _gridState createState() => _gridState();
}

// ignore: camel_case_types
class _gridState extends State<grid> {
  @override
  Widget build(BuildContext context) {

    void _launchURL(String url) async{
      if(await canLaunch(url)){
        await launch(url);
      }
      else{
        throw 'Could not launch!';
      }
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: new Container(
        child: Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString(
                'json_data/DogBreedDb.json'),
            builder: (context, snapshot){
              var breeds = jsonDecode(snapshot.data.toString());
              print("Breeds:$breeds");


              return new GridView.builder(
                itemCount: breeds.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),


                itemBuilder: (BuildContext context, int index){
                  return new GestureDetector(
                    child: new Card(
                        elevation: 5.0,
                        color: Colors.transparent,
                        child: new Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xff622F74),
                          ),
                          alignment: Alignment.center,
                          child: new Text(breeds[index]['name'],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),),
                        )
                    ),



                    onTap: (){
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder:(BuildContext context) {

                          return Dialog(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 600,
                              margin: EdgeInsets.only(left: 5, right:5, top: 5, bottom: 5),
                              child: Column(
                                children: <Widget>[
                                  new Text("\n" + breeds[index]['name'],
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  new Icon(
                                    Icons.pets,
                                    color: Colors.red,
                                  ),

                                  new Text("\nOrigin: " + breeds[index]['origin'] + "\n"),
                                  new Text("Thriving Conditions: " + breeds[index]['suitable_conditions'] +"\n"),
                                  new Text("Power Fuel: " + breeds[index]['power_fuel'] + "\n"),
                                  new Text("Daily Workout: " + breeds[index]['daily_workout'] + "\n"),
                                  new Text("Common Ailments: " + breeds[index]['common_ailments'] + "\n"),
                                  new Text("Speciality: " + breeds[index]['speciality'] + "\n"),
                                  new Text("Annoying Habits: " + breeds[index]['annoying_habits'] + "\n"),
                                  new Text("Special Appearance: " + breeds[index]['special_appearance'] + "\n\n"),



                                  new RaisedButton(
                                    child: new Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),

                                  new RaisedButton(
                                    child: Text("Search"),
                                    onPressed: () {
                                      _launchURL('https://www.google.com/imghp?hl=EN');
                                    },
                                  ),

                                  new Text("Want to see what I look like? Search!!",
                                    style: TextStyle(
                                        fontSize: 12
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(top:50, left: 50, right: 50),
                                  ),

                                ],
                              ),
                            ),
                          );


                        },
                      );
                    },

                  );
                },
              );
            },
          ),
        ),
      ),
      //body: myGrid,
    );


  }
}



