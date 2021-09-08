import 'dart:math';
import 'package:flutter/material.dart';

double randomBorderRadius() {
  return Random().nextDouble() * 128;
}

double randomMargin() {
  return Random().nextDouble() * 128;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class ShapeAnimation extends StatefulWidget {
  _ShapeAnimationState createState() => _ShapeAnimationState();
}

class _ShapeAnimationState extends State<ShapeAnimation> {
  Color color;
  double borderRadius;
  double margin;

  @override
  initState() {
    super.initState();
    color = randomColor();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shape Animation'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: 400,
            height: 400,
            child: AnimatedContainer(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black12,
                  ),
                  child: Text(
                    color.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              duration: Duration(milliseconds: 500),
              margin: EdgeInsets.all(margin),
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(borderRadius)),
            ),
          ),
          Container(height: 20.0),
          RaisedButton(
            elevation: 5.0,
            child: Text('Change'),
            textColor: Colors.white,
            color: Colors.deepPurple,
            onPressed: () {
              setState(() {
                color = randomColor();
                borderRadius = randomBorderRadius();
                margin = randomMargin();
              });
            },
          )
        ]),
      ),
    );
  }
}
