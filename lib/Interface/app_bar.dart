import 'dart:ui';
import 'package:dizzy/Interface/app_bar_dark.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget {
  final String appBarTitle;

  AppBarCustom({this.appBarTitle});

  @override
  _AppBarCustomState createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.0)),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              actions: [
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppBarCustomDark()));
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.settings_outlined),
                  color: Colors.black,
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
                color: Colors.black,
                onPressed: () => Navigator.pop(context),
              ),
              elevation: 0.0,
              collapsedHeight: 59.0,
              backgroundColor: Color(0xFFfd6f51).withOpacity(0.5),
              expandedHeight: MediaQuery.of(context).size.height / 2,
              pinned: true,
              stretch: true,
              onStretchTrigger: () {
                return;
              },
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(100.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 13.0, vertical: 13.0),
                  child: TextField(
                    cursorWidth: 1.0,
                    cursorColor: Colors.black87,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w300,
                    ),
                    cursorHeight: 24.0,
                    decoration: InputDecoration(
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      disabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.black38,
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              flexibleSpace: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 24.0, sigmaY: 24.0),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        background: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              tileMode: TileMode.mirror,
                              colors: [
                                Colors.grey,
                                Colors.white,
                              ],
                            ),
                          ),
                        ),
                        stretchModes: [
                          StretchMode.zoomBackground,
                          StretchMode.blurBackground,
                        ],
                        titlePadding: EdgeInsets.all(13.0),
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: Text(
                            widget.appBarTitle ?? 'Chats',
                            style: TextStyle(
                                fontSize: 54.0,
                                fontWeight: FontWeight.w200,
                                color: Colors.black87),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 80.0,
              delegate: SliverChildBuilderDelegate((context, i) {
                return ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(4.0),
                    height: 55.0,
                    width: 55.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFfd6f51)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          50,
                        ),
                      ),
                      // image: DecorationImage(
                      //   image: AssetImage('images/img$i.jpg'),
                      //   fit: BoxFit.cover,
                      // )
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/img$i.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  tileColor: Colors.white,
                  title:
                      Text('Contact $i', style: TextStyle(color: Colors.black)),
                  subtitle: Text('Description $i',
                      style: TextStyle(color: Colors.black87)),
                  trailing: Icon(Icons.messenger_outline_sharp),
                  onTap: () {},
                  enableFeedback: true,
                );
              }, childCount: 20),
            )
          ],
        ),
      ),
    );
  }
}
