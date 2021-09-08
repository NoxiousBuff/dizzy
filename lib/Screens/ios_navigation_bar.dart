import 'package:dizzy/Screens/fade_in.dart';
import 'package:dizzy/Screens/main_screen.dart';
import 'package:dizzy/Screens/shape_changing.dart';
import 'package:dizzy/Screens/sliver_app.dart';
import 'package:dizzy/fluent/show_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CupertinoNavigation extends StatefulWidget {
  @override
  _CupertinoNavigationState createState() => _CupertinoNavigationState();
}

class _CupertinoNavigationState extends State<CupertinoNavigation> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.star),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Chat',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return ShowScreen(
                color: Color(0xffa4373a),
                text: 'Chat',
                headline: 'Chats',
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ShowScreen(
                  color: Color(0xff077568),
                  text: 'Status',
                  headline: 'People',
                ),
              );
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ShowScreen(
                  color: Color(0xff3955a3),
                  text: 'Call',
                  headline: 'Calls',
                ),
              );
            });
            break;
          case 3:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ShowScreen(
                  color: Color(0xff797775),
                  text: 'Setting',
                  headline: 'Preference',
                ),
              );
            });
            break;
        }
        return returnValue;
      },
    );
  }
}
