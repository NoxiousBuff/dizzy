import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationSettingsKaran extends StatefulWidget {
  @override
  _NotificationSettingsStateKaran createState() =>
      _NotificationSettingsStateKaran();
}

class _NotificationSettingsStateKaran extends State<NotificationSettingsKaran> {
  bool _isTrue = false;
  bool _isTrue1 = false;
  bool _isTrue2 = false;
  bool _isTrue3 = false;
  bool _isTrue4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1d2733),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_outlined)),
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Notification Settings',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline4),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 0.01,
                            blurRadius: 5.0,
                            color: Theme.of(context).shadowColor)
                      ],
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Column(
                    children: <Widget>[
                      SwitchListTile(
                        inactiveThumbImage: AssetImage('images/img2.jpg'),
                        activeThumbImage: AssetImage('images/img1/jpg'),
                        activeColor: Theme.of(context).toggleButtonsTheme.color,
                        activeTrackColor:
                            Theme.of(context).toggleButtonsTheme.fillColor,
                        title: Text(
                          'Messages',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        value: _isTrue,
                        onChanged: (bool value) {
                          setState(() {
                            _isTrue = value;
                          });
                        },
                        secondary: Icon(
                          Icons.messenger_outline,
                          color: Theme.of(context).primaryIconTheme.color,
                        ),
                      ),
                      ListTile(
                        title: Text('Notification tone',
                            style: Theme.of(context).textTheme.headline5),
                      ),
                      ListTile(
                          title: Text('Vibrate',
                              style: Theme.of(context).textTheme.headline5)),
                      ListTile(
                          title: Text('Popup notification',
                              style: Theme.of(context).textTheme.headline5)),
                      ListTile(
                          title: Text('Light',
                              style: Theme.of(context).textTheme.headline5)),
                      ListTile(
                          title: Text('Use high priority notification',
                              style: Theme.of(context).textTheme.headline5))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 0.01,
                            blurRadius: 5.0,
                            color: Theme.of(context).shadowColor)
                      ],
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Column(
                    children: <Widget>[
                      SwitchListTile(
                        title: Text(
                          'Groups',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        value: _isTrue1,
                        onChanged: (bool value) {
                          setState(() {
                            _isTrue1 = value;
                          });
                        },
                        secondary: Icon(
                          Icons.group_outlined,
                          color: Theme.of(context).primaryIconTheme.color,
                        ),
                      ),
                      ListTile(
                        title: Text('Notification tone',
                            style: Theme.of(context).textTheme.headline5),
                      ),
                      ListTile(
                          title: Text('Vibrate',
                              style: Theme.of(context).textTheme.headline5)),
                      ListTile(
                          title: Text('Popup notification',
                              style: Theme.of(context).textTheme.headline5)),
                      ListTile(
                          title: Text('Light',
                              style: Theme.of(context).textTheme.headline5)),
                      ListTile(
                          title: Text('Use high priority notification',
                              style: Theme.of(context).textTheme.headline5))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 0.01,
                            blurRadius: 5.0,
                            color: Theme.of(context).shadowColor)
                      ],
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Column(
                    children: [
                      SwitchListTile(
                        title: Text(
                          'In-App',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        value: _isTrue2,
                        onChanged: (bool value) {
                          setState(() {
                            _isTrue2 = value;
                          });
                        },
                        secondary: Icon(
                          Icons.notifications_none_outlined,
                          color: Theme.of(context).primaryIconTheme.color,
                        ),
                      ),
                      ListTile(
                        title: Text('In-App sounds',
                            style: Theme.of(context).textTheme.headline5),
                      ),
                      ListTile(
                          title: Text('In-App vibrate',
                              style: Theme.of(context).textTheme.headline5)),
                      ListTile(
                          title: Text('In-App preview',
                              style: Theme.of(context).textTheme.headline5)),
                      ListTile(
                          title: Text('In- Chat sounds',
                              style: Theme.of(context).textTheme.headline5)),
                      ListTile(
                          title: Text('Importance',
                              style: Theme.of(context).textTheme.headline5))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 0.01,
                            blurRadius: 5.0,
                            color: Theme.of(context).shadowColor)
                      ],
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(30.0))),
                  child: Column(
                    children: [
                      SwitchListTile(
                        title: Text(
                          'Calls',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        value: _isTrue3,
                        onChanged: (bool value) {
                          setState(() {
                            _isTrue3 = value;
                          });
                        },
                        secondary: Icon(
                          Icons.call_outlined,
                          color: Theme.of(context).primaryIconTheme.color,
                        ),
                      ),
                      ListTile(
                        title: Text('Ringtone',
                            style: Theme.of(context).textTheme.headline5),
                      ),
                      ListTile(
                          title: Text('Vibrate',
                              style: Theme.of(context).textTheme.headline5)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 0.01,
                            blurRadius: 5.0,
                            color: Theme.of(context).shadowColor)
                      ],
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Column(
                    children: [
                      SwitchListTile(
                        title: Text(
                          'Focus',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        value: _isTrue4,
                        onChanged: (bool value) {
                          setState(() {
                            _isTrue4 = value;
                          });
                        },
                        secondary: Icon(
                          Icons.center_focus_strong_outlined,
                          color: Theme.of(context).primaryIconTheme.color,
                        ),
                      ),
                      ListTile(
                        title: Text('Notification tone',
                            style: Theme.of(context).textTheme.headline5),
                      ),
                      ListTile(
                          title: Text('Vibrate',
                              style: Theme.of(context).textTheme.headline5)),
                      ListTile(
                          title: Text('Popup notification',
                              style: Theme.of(context).textTheme.headline5)),
                      ListTile(
                          title: Text('Light',
                              style: Theme.of(context).textTheme.headline5)),
                      ListTile(
                          title: Text('Use high priority notification',
                              style: Theme.of(context).textTheme.headline5))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
