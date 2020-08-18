import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:boop_app/NamedList.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class BoopList extends StatelessWidget {
  final List<NamedList> BoopName;
  BoopList({Key key, this.BoopName}) : super(key:key);


  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(

        itemCount: BoopName == null ? 0 : BoopName.length,
        itemBuilder: (BuildContext context, int index){

          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: ScaleAnimation(
              //verticalOffset: 50,
                child: FadeInAnimation(
                  child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

                    child: InkWell(
                      splashColor: Colors.black,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent, width: 2.75),
                          color: Color(0xff622F74).withOpacity(0.85),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text("  " + BoopName[index].name,
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
                      onTap: () {},
                    ),
                  ),
                )
            ),
          );
        },
      ),
    );
  }
}
