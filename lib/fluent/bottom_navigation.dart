import 'package:dizzy/fluent/show_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  static List<Widget> _widgetOptions = <Widget>[
    ShowScreen(
      color: Color(0xffa4373a),
      text: 'Chat',
      headline: 'Chats',
    ),
    ShowScreen(
      color: Color(0xff077568),
      text: 'Status',
      headline: 'People',
    ),
    ShowScreen(
      color: Color(0xff3955a3),
      text: 'Call',
      headline: 'Calls',
    ),
    ShowScreen(
      color: Color(0xff797775),
      text: 'Setting',
      headline: 'Preference',
    ),
  ];

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavigation._widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.white54))),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Color(0xFF6200EE),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (value) {
            _onItemTapped(value);
          },
          items: [
            BottomNavigationBarItem(
              label: 'Chats',
              icon: Icon(CupertinoIcons.chat_bubble),
              activeIcon: Icon(CupertinoIcons.chat_bubble_2_fill),
            ),
            BottomNavigationBarItem(
              label: 'People',
              icon: Icon(Icons.people_alt_outlined),
              activeIcon: Icon(Icons.people),
            ),
            BottomNavigationBarItem(
              label: 'Calls',
              icon: Icon(Icons.call_outlined),
              activeIcon: Icon(Icons.call),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
