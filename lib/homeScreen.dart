import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:convert';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


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
                fontSize: 22.0,
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


  List URLList = ['images/afador.jpg', 'images/americanbulldog.jpg', 'images/beagle.jpg', 'images/bichon.jpg',
    'images/cavapoo.jpg', 'images/Cockalier.jpg', 'images/Dalmatian.jpeg', 'images/deutscher.jpg',
    'images/EnglishSetter.jpg', 'images/eurasier.jpg', 'images/frenchbulldog.jpg', 'images/foxterrier.jpg',
    'images/germanshepherd.jpg',  'images/greatdanw.jpg', 'images/goldenretriever.jpg', 'images/havanese.jpg',
    'images/IrishWolfhound.png', 'images/Jackapoo.jpg', 'images/JapaneseChin.jpg', 'images/KaiKen.jpg', 'images/Komondor.jpg',
    'images/Labrador.jpg', 'images/Maltese.jpg',  'images/Poodle.jpg', 'images/Pug.jpg', 'images/Pomeranian.jpg',
    'images/Saintbernard.jpg', 'images/SiberianHusky.jpg', 'images/ShibaInu.jpg',  'images/TexasHeeler.jpg',
    'images/ValleyBulldog.jpg'
  ];


  @override
  Widget build(BuildContext context) {

    int columnCount = 2;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: new Container(
        child: Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString(
                'json_data/DogBreedDb.json'),
            builder: (context, snapshot){
              var breeds = jsonDecode(snapshot.data.toString());


              return AnimationLimiter(
                child: GridView.builder(
                  itemCount: breeds.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),


                  itemBuilder: (BuildContext context, int index){
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: InkWell(
                            splashColor: Colors.cyanAccent,
                            child: Card(
                              elevation: 10.0,
                              color: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: Colors.blueAccent, width: 2.75),
                                  color: Color(0xff622F74).withOpacity(0.85),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.45),
                                      offset: Offset(1.0, 6.0),
                                      blurRadius: 20.0,
                                    ),
                                  ],
                                ),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[

                                        SizedBox(height: 10,),
                                        CircleAvatar(
                                          radius: 45,
                                          backgroundColor: Colors.blueAccent,
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(URLList[index],),
                                            radius: 43,
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(top: 12, left: 4, right: 4, bottom: 4),
                                          child: Text(breeds[index]['name'],
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white.withOpacity(0.85),
                                            ),
                                            textAlign: TextAlign.center,
                                            ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              )
                          ),



                          onTap: (){
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder:(BuildContext context) {

                                return Dialog(
                                  backgroundColor: Color(0xff622F74).withOpacity(0.75),
                                  elevation: 10,
                                  child: InkWell(
                                    splashColor: Colors.black,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.cyan.withOpacity(0.77),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      width: MediaQuery.of(context).size.width*0.8,
                                      height: MediaQuery.of(context).size.height*0.8,
                                      margin: EdgeInsets.only(left: 5, right:5, top: 5, bottom: 5),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(10,10,10,0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: <Widget>[
                                              Text("\n" + breeds[index]['name'],
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.white.withOpacity(0.8),
                                                ),
                                              ),


                                              Padding(
                                                padding: EdgeInsets.all(5),
                                                child: CircleAvatar(
                                                  radius: 55,
                                                  backgroundColor:Colors.deepPurple.withOpacity(0.85),
                                                  child: CircleAvatar(
                                                    radius: 53,
                                                    backgroundImage: AssetImage(URLList[index]),
                                                  ),
                                                ),
                                              ),

                                              Text("\nOrigin: " , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white.withOpacity(0.7),)),
                                              Text(breeds[index]['origin'] + "\n" , style: TextStyle( fontSize: 16, color: Colors.white.withOpacity(0.7),), textAlign: TextAlign.center,),
                                              Text("Thriving Conditions: " , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white.withOpacity(0.7),)),
                                              Text(breeds[index]['suitable_conditions'] +"\n", style: TextStyle( fontSize: 16, color: Colors.white.withOpacity(0.7),),textAlign: TextAlign.center,),
                                              Text("Power Fuel: " , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white.withOpacity(0.7),)),
                                              Text(breeds[index]['power_fuel'] + "\n", style: TextStyle( fontSize: 16, color: Colors.white.withOpacity(0.7),),textAlign: TextAlign.center,),
                                              Text("Daily Workout: " , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white.withOpacity(0.7),)),
                                              Text(breeds[index]['daily_workout'] + "\n", style: TextStyle( fontSize: 16, color: Colors.white.withOpacity(0.7),),textAlign: TextAlign.center,),
                                              Text("Common Ailments: " , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white.withOpacity(0.7),)),
                                              Text(breeds[index]['common_ailments'] + "\n", style: TextStyle( fontSize: 16, color: Colors.white.withOpacity(0.7),),textAlign: TextAlign.center,),
                                              Text("Speciality: " , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white.withOpacity(0.7),)),
                                              Text(breeds[index]['speciality'] + "\n", style: TextStyle( fontSize: 16, color: Colors.white.withOpacity(0.7),),textAlign: TextAlign.center,),
                                              Text("Annoying Habits: " , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white.withOpacity(0.7),)),
                                              Text(breeds[index]['annoying_habits'] + "\n", style: TextStyle( fontSize: 16, color: Colors.white.withOpacity(0.7),),textAlign: TextAlign.center,),
                                              Text("Special Appearance: " , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white.withOpacity(0.7),)),
                                              Text(breeds[index]['special_appearance'] + "\n\n", style: TextStyle( fontSize: 16, color: Colors.white.withOpacity(0.7),),textAlign: TextAlign.center,),



                                              RaisedButton(
                                                splashColor: Colors.purple.withOpacity(0.86),
                                                hoverColor: Colors.purple.withOpacity(0.86),

                                                child: Text("OK"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),

                                              Padding(
                                                padding: EdgeInsets.only(top:50, left: 50, right: 50),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
      //body: myGrid,
    );


  }
}



