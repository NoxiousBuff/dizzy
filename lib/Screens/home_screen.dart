import 'package:flutter/material.dart';

import 'package:dizzy/Screens/fade_in.dart';
import 'package:dizzy/Screens/shape_changing.dart';
import 'package:dizzy/Screens/sliver_app.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animations'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //item 1
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ShapeAnimation();
                    }));
                  },
                  child: SizedBox(
                    width: 400.0,
                    height: 100.0,
                    child: Container(
                        padding: EdgeInsets.only(right: 20.0, left: 20.0),
                        child: Center(
                          child: Text('Color Picker',
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.white70)),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.deepPurple,
                        )),
                  )),

              Container(
                height: 25.0,
              ),

              //item 2
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FadeInMain();
                    }));
                  },
                  child: SizedBox(
                    width: 400.0,
                    height: 100.0,
                    child: Container(
                        padding: EdgeInsets.only(right: 20.0, left: 20.0),
                        child: Center(
                          child: Text('Fade In Animation',
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.white70)),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.red,
                        )),
                  )),

              Container(
                height: 25.0,
              ),

              //third element
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SliverApp();
                    }));
                  },
                  child: SizedBox(
                    width: 400.0,
                    height: 100.0,
                    child: Container(
                        padding: EdgeInsets.only(right: 20.0, left: 20.0),
                        child: Center(
                          child: Text('Sliver App Bar',
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.white70)),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.green,
                        )),
                  )),
            ],
          ),
        ));
  }
}
