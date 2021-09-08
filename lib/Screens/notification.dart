import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kNotificationHeading = TextStyle(
    fontSize: 20.0,
    fontFamily: 'QuickSand',
    fontWeight: FontWeight.bold,
    color: Colors.white);

const kNotificationInput =
    TextStyle(fontSize: 18.0, fontFamily: 'QuickSand', color: Colors.white60);

bool isTrue = false;

class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white.withOpacity(0.1),
              leading: Icon(Icons.arrow_back_ios_outlined),
              pinned: true,
              expandedHeight: 100.0,
              flexibleSpace: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 24.0, sigmaX: 24.0),
                  child: FlexibleSpaceBar(
                    title: Text(
                      'Notification Settings',
                      style: kNotificationHeading.copyWith(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        trailing: Icon(Icons.menu),
                        title: SwitchListTile(
                          title: Text(
                            'Messages',
                            style: kNotificationHeading,
                          ),
                          value: true,
                          onChanged: (bool value) {},
                          secondary: Icon(
                            Icons.messenger_outline,
                            color: Colors.white,
                          ),
                        ),
                        children: [
                          ListTile(
                            title: Text('Notification tone',
                                style: kNotificationInput),
                          ),
                          ListTile(
                              title:
                                  Text('Vibrate', style: kNotificationInput)),
                          ListTile(
                              title: Text('Popup notification',
                                  style: kNotificationInput)),
                          ListTile(
                              title: Text('Light', style: kNotificationInput)),
                          ListTile(
                              title: Text('Use high priority notification',
                                  style: kNotificationInput))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        trailing: Icon(Icons.menu),
                        title: SwitchListTile(
                          title: Text(
                            'Groups',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          value: true,
                          onChanged: (bool value) {},
                          secondary: Icon(
                            Icons.group_outlined,
                            color: Colors.white,
                          ),
                        ),
                        children: [
                          ListTile(
                            title: Text('Notification tone',
                                style: kNotificationInput),
                          ),
                          ListTile(
                              title:
                                  Text('Vibrate', style: kNotificationInput)),
                          ListTile(
                              title: Text('Popup notification',
                                  style: kNotificationInput)),
                          ListTile(
                              title: Text('Light', style: kNotificationInput)),
                          ListTile(
                              title: Text('Use high priority notification',
                                  style: kNotificationInput))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        trailing: Icon(Icons.menu),
                        title: SwitchListTile(
                          title: Text(
                            'In-App',
                            style: kNotificationHeading,
                          ),
                          value: true,
                          onChanged: (bool value) {},
                          secondary: Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.white,
                          ),
                        ),
                        children: [
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
                              title:
                                  Text('Importance', style: kNotificationInput))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        trailing: Icon(Icons.menu),
                        title: SwitchListTile(
                          title: Text(
                            'Calls',
                            style: kNotificationHeading,
                          ),
                          value: true,
                          onChanged: (bool value) {},
                          secondary: Icon(
                            Icons.call_outlined,
                            color: Colors.white,
                          ),
                        ),
                        children: [
                          ListTile(
                            title: Text('Ringtone', style: kNotificationInput),
                          ),
                          ListTile(
                              title:
                                  Text('Vibrate', style: kNotificationInput)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        trailing: Icon(Icons.menu),
                        title: SwitchListTile(
                          title: Text(
                            'Focus',
                            style: kNotificationHeading,
                          ),
                          value: true,
                          onChanged: (bool value) {},
                          secondary: Icon(
                            Icons.center_focus_strong_outlined,
                            color: Colors.white,
                          ),
                        ),
                        children: [
                          ListTile(
                            title: Text('Notification tone',
                                style: kNotificationInput),
                          ),
                          ListTile(
                              title:
                                  Text('Vibrate', style: kNotificationInput)),
                          ListTile(
                              title: Text('Popup notification',
                                  style: kNotificationInput)),
                          ListTile(
                              title: Text('Light', style: kNotificationInput)),
                          ListTile(
                              title: Text('Use high priority notification',
                                  style: kNotificationInput))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
