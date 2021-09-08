import 'package:dizzy/Themes/rolling_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RollingSwitch(
                value: true,
                colorOn: Colors.greenAccent[700],
                colorOff: Colors.redAccent[700],
                iconOn: Icons.done,
                iconOff: Icons.remove_circle_outline,
                onChanged: (bool state) {
                  //Use it to manage the different states
                  print('Current State of SWITCH IS: $state');
                },
              ),
              CupertinoSwitch(value: false, onChanged: (value) {})
            ],
          ),
        ),
      ),
    );
  }
}
