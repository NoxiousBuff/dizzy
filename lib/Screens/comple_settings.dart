import 'package:flutter/material.dart';

const kNotificationInput = TextStyle(fontSize: 18.0, color: Color(0xFF474b4a));
const kNotificationHeading = TextStyle(fontSize: 20.0, color: Colors.white);

class ComplexSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1d2733),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  color: Colors.transparent,
                  child: Text('Notification Settings',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF1d2733),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                        ),
                      ]),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff212d3b),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0)),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                  trailing: Icon(
                                    Icons.toggle_off,
                                    size: 50.0,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'Messages',
                                    style: kNotificationHeading,
                                  )),
                              ListTile(
                                title: Text('Notification tone',
                                    style: kNotificationInput),
                              ),
                              ListTile(
                                  title: Text('Vibrate',
                                      style: kNotificationInput)),
                              ListTile(
                                  title: Text('Popup notification',
                                      style: kNotificationInput)),
                              ListTile(
                                  title:
                                      Text('Light', style: kNotificationInput)),
                              ListTile(
                                  title: Text('Use high priority notification',
                                      style: kNotificationInput))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff212d3b),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0)),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                  trailing: Icon(
                                    Icons.toggle_off,
                                    size: 50.0,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'Groups',
                                    style: kNotificationHeading,
                                  )),
                              ListTile(
                                title: Text('Notification tone',
                                    style: kNotificationInput),
                              ),
                              ListTile(
                                  title: Text('Vibrate',
                                      style: kNotificationInput)),
                              ListTile(
                                  title: Text('Popup notification',
                                      style: kNotificationInput)),
                              ListTile(
                                  title:
                                      Text('Light', style: kNotificationInput)),
                              ListTile(
                                  title: Text('Use high priority notification',
                                      style: kNotificationInput))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff212d3b),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0)),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                  trailing: Icon(
                                    Icons.toggle_off,
                                    size: 50.0,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'In-App Notification',
                                    style: kNotificationHeading,
                                  )),
                              ListTile(
                                title: Text('In-App sounds',
                                    style: kNotificationInput),
                              ),
                              ListTile(
                                  title: Text('In-App vibrate',
                                      style: kNotificationInput)),
                              ListTile(
                                  title: Text('In-App preview',
                                      style: kNotificationInput)),
                              ListTile(
                                  title: Text('In- Chat sounds',
                                      style: kNotificationInput)),
                              ListTile(
                                  title: Text('Importance',
                                      style: kNotificationInput))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff212d3b),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0)),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                  title: Text(
                                'Calls',
                                style: kNotificationHeading,
                              )),
                              ListTile(
                                title:
                                    Text('Ringtone', style: kNotificationInput),
                              ),
                              ListTile(
                                  title: Text('Vibrate',
                                      style: kNotificationInput)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
