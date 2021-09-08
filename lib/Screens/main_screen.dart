import 'dart:ui';
import 'package:dizzy/Screens/calls_screen.dart';
import 'package:dizzy/Screens/recent_chats.dart';
import 'package:dizzy/Screens/status_page.dart';
import 'package:dizzy/Screens/testing1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dizzy/Screens/theme_data.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final pageController = PageController(initialPage: 1, keepPage: true);
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Reconnect',
          style: TextStyle(
              color: Provider.of<Data>(context).isDark
                  ? Colors.white70
                  : Colors.black87),
        ),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
            child: Container(
              decoration:
                  BoxDecoration(color: Colors.deepPurple.withOpacity(0.5)),
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.camera_alt_outlined,
                  color: Provider.of<Data>(context).isDark
                      ? Colors.white70
                      : Colors.black87,
                ),
              ),
              Tab(
                child: Text(
                  'Chats',
                  style: TextStyle(
                      color: Provider.of<Data>(context).isDark
                          ? Colors.white70
                          : Colors.black87),
                ),
              ),
              Tab(
                child: Text(
                  'Status',
                  style: TextStyle(
                      color: Provider.of<Data>(context).isDark
                          ? Colors.white70
                          : Colors.black87),
                ),
              ),
              Tab(
                child: Text(
                  'Calls',
                  style: TextStyle(
                      color: Provider.of<Data>(context).isDark
                          ? Colors.white70
                          : Colors.black87),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search,
                  color: Provider.of<Data>(context).isDark
                      ? Colors.white70
                      : Colors.black87)),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Icon(
                  Provider.of<Data>(context).isDark
                      ? Icons.wb_sunny
                      : Icons.nightlight_round,
                  color: Provider.of<Data>(context).isDark
                      ? Colors.white70
                      : Colors.black87,
                ),
                onTap: () {
                  Provider.of<Data>(context, listen: false).changeTheme();
                },
              )),
          // Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Checkbox(
          //     value: Provider.of<Data>(context).isDark,
          //     onChanged: (random) {
          //       Provider.of<Data>(context, listen: false).changeTheme();
          //     },
          //   ),
          // ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert,
                  color: Provider.of<Data>(context).isDark
                      ? Colors.white70
                      : Colors.black87))
        ],
      ),
      body: TabBarView(
        controller: tabController,
        dragStartBehavior: DragStartBehavior.start,
        children: [
          MenuDashBoard(),
          RecentChats(),
          StatusPage(),
          CallsScreen(),
        ],
      ),
    );
  }
}
