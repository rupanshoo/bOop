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

  // ignore: non_constant_identifier_names
  List URLList= [ 'https://www.petguide.com/wp-content/uploads/2017/03/afador.jpg',
  'https://i.pinimg.com/originals/b6/50/d5/b650d5145d1ae635e0ed825c2928ed67.jpg',
  'https://vetstreet.brightspotcdn.com/dims4/default/1b8af22/2147483647/thumbnail/645x380/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F6b%2F2d0f009e8c11e0a2380050568d634f%2Ffile%2FBeagle-2-645mk062311.jpg',
  'https://i2.wp.com/media.globalnews.ca/videostatic/672/731/5a85cc6b60b2765a57a7189b-1280x720_1_Feb_15_2018_18_07_58_poster.jpg?w=1040&quality=70&strip=all',
  'https://nutshawkennels.co.uk/wp-content/uploads/Cavapoo.jpg',
  'https://www.dogbreedslist.info/uploads/allimg/dog-pictures/Cockalier-2.jpg',
  'https://worlddogfinder.com/imager/880x495/upload/dalmatian_dog.jpg',
  'https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/29130931/AdobeStock_1083293871.jpg',
  'https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/28135356/English-Setter-standing-in-a-field.jpg',
  'https://i.pinimg.com/564x/2b/26/08/2b2608efecb201e02cecdec274cf6087.jpg',
  'https://www.monstersandcritics.com/wp-content/uploads/2020/03/beatrice-dog-from-modern-family-1.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/01_Wire_Fox_terrier.jpg/1200px-01_Wire_Fox_terrier.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/German_Shepherd_-_DSC_0346_%2810096362833%29.jpg/220px-German_Shepherd_-_DSC_0346_%2810096362833%29.jpg',
  'https://cdn.orvis.com/images/DBS_GreatDane_1280.jpg',
  'https://i.pinimg.com/originals/82/66/31/826631d3809a918dfc7710ebce238903.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/e/ed/A_Havanese_judging.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/d/da/%282%29_Irish_Wolfhound_4.jpg',
  'https://i.pinimg.com/originals/df/cd/64/dfcd641ad6007c664fc3e0aa0694f4b5.jpg',
  'https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/20164850/Japanese-Chin-standing-outdoors.jpg',
  'https://i.pinimg.com/originals/e5/63/41/e56341fb69cfdc2c514453d00fc2da58.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/8/8b/Komondor_delvin.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Labrador_on_Quantock_%282175262184%29.jpg/1200px-Labrador_on_Quantock_%282175262184%29.jpg',
  'https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/08152421/Maltese-laying-down-in-a-chair.jpg',
  'https://i.pinimg.com/originals/13/cb/d7/13cbd7bc6a0de54b58f1b61e053b56ee.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/f/f0/Mops_oct09_cropped2.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/c/ca/Pomeranian.JPG',
  'https://upload.wikimedia.org/wikipedia/commons/6/64/Hummel_Vedor_vd_Robandahoeve.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/a/a3/Black-Magic-Big-Boy.jpg',
  'https://i.pinimg.com/originals/84/99/d0/8499d08b77b55d6ff09401b86efdfc7a.jpg',
  'https://i.pinimg.com/originals/7b/ce/e2/7bcee212ab6928f16e8ce8f8480e349c.jpg',
  'https://i.pinimg.com/originals/26/45/58/264558c7571006b39b5ab589f727e01a.jpg'
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
                                  border: Border.all(color: Colors.blueAccent),
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
                                            backgroundImage: NetworkImage(URLList[index],),
                                            radius: 43,
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(top: 15, left: 4, right: 4, bottom: 4),
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
                                        color: Colors.cyan.withOpacity(0.75),
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
                                                  color: Colors.white.withOpacity(0.8),
                                                ),
                                              ),


                                              Padding(
                                                padding: EdgeInsets.all(5),
                                                child: CircleAvatar(
                                                  radius: 50,
                                                  backgroundColor:Colors.deepPurple.withOpacity(0.85),
                                                  child: CircleAvatar(
                                                    radius: 48,
                                                    backgroundImage: NetworkImage(URLList[index]),
                                                  ),
                                                ),
                                              ),

                                              Text("\nOrigin: " + breeds[index]['origin'] + "\n" , style: TextStyle( fontSize: 16, color: Colors.white.withOpacity(0.75),),),
                                              Text("Thriving Conditions: " + breeds[index]['suitable_conditions'] +"\n", style: TextStyle( fontSize: 16, color: Colors.white.withOpacity(0.75),),),
                                              Text("Power Fuel: " + breeds[index]['power_fuel'] + "\n", style: TextStyle( fontSize: 16, color: Colors.white.withOpacity(0.75),),),
                                              Text("Daily Workout: " + breeds[index]['daily_workout'] + "\n", style: TextStyle( fontSize: 16, color: Colors.white.withOpacity(0.75),),),
                                              Text("Common Ailments: " + breeds[index]['common_ailments'] + "\n", style: TextStyle( fontSize: 16, color: Colors.white.withOpacity(0.75),),),
                                              Text("Speciality: " + breeds[index]['speciality'] + "\n", style: TextStyle( fontSize: 16, color: Colors.white.withOpacity(0.75),),),
                                              Text("Annoying Habits: " + breeds[index]['annoying_habits'] + "\n", style: TextStyle( fontSize: 16, color: Colors.white.withOpacity(0.75),),),
                                              Text("Special Appearance: " + breeds[index]['special_appearance'] + "\n\n", style: TextStyle( fontSize: 16, color: Colors.white.withOpacity(0.75),),),



                                              RaisedButton(
                                                splashColor: Colors.purple.withOpacity(0.86),
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



