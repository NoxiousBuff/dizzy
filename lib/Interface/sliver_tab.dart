import 'package:dizzy/Interface/app_bar_dark.dart';
import 'package:dizzy/Screens/calls_screen.dart';
import 'package:dizzy/Screens/camera_app.dart';
import 'package:dizzy/Screens/recent_chats.dart';
import 'package:dizzy/Screens/status_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

const kTabTextStyle = TextStyle(fontSize: 40.0, fontWeight: FontWeight.w300);

class SliverTabBarCustom extends StatefulWidget {
  @override
  _SliverTabBarCustomState createState() => _SliverTabBarCustomState();
}

class _SliverTabBarCustomState extends State<SliverTabBarCustom>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = ['Camera', 'Chat', 'Status', 'Calls'];
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: DefaultTabController(
        length: _tabs.length,
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    flexibleSpace: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.grey.shade700,
                            Colors.black,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          PreferredSize(
                            preferredSize: Size.fromHeight(60.0),
                            child: TabBar(
                              dragStartBehavior: DragStartBehavior.down,
                              labelStyle: kTabTextStyle,
                              labelColor: Colors.white70,
                              unselectedLabelColor: Colors.white30,
                              unselectedLabelStyle: kTabTextStyle.copyWith(
                                  fontSize: 35, fontWeight: FontWeight.w200),
                              labelPadding: EdgeInsets.all(8.0),
                              indicatorColor: Colors.transparent,
                              isScrollable: true,
                              controller: tabController,
                              tabs: _tabs
                                  .map((String name) => Tab(text: name))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AppBarCustomDark()));
                            });
                          }),
                      IconButton(
                        icon: Icon(Icons.settings_outlined),
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AppBarCustomDark()));
                          });
                        },
                      )
                    ],
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios_outlined),
                      onPressed: () => Navigator.pop(context),
                    ),
                    elevation: 0.0,
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    expandedHeight: MediaQuery.of(context).size.height / 3,
                    pinned: true,
                    forceElevated: innerBoxIsScrolled,
                    stretch: true,
                    onStretchTrigger: () {
                      return;
                    },
                  )),
            ];
          },
          body: Builder(
            builder: (context) {
              return CustomScrollView(slivers: [
                SliverOverlapInjector(
                  // This is the flip side of the SliverOverlapAbsorber
                  // above.
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverFillRemaining(
                  child: TabBarView(
                    dragStartBehavior: DragStartBehavior.start,
                    children: [
                      CameraApp(),
                      RecentChats(),
                      StatusPage(),
                      CallsScreen(),
                    ],
                  ),
                ),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
