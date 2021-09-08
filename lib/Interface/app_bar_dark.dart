import 'dart:ui';
import 'package:dizzy/Interface/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarCustomDark extends StatefulWidget {
  @override
  _AppBarCustomStateDark createState() => _AppBarCustomStateDark();
}

class _AppBarCustomStateDark extends State<AppBarCustomDark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppBarCustom()));
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.settings_outlined),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppBarCustom()));
                  });
                },
              )
            ],
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined),
              onPressed: () => Navigator.pop(context),
            ),
            elevation: 0.0,
            collapsedHeight: 150.0,
            backgroundColor: Colors.grey.shade900.withOpacity(0.5),
            expandedHeight: MediaQuery.of(context).size.height / 2,
            pinned: true,
            stretch: true,
            onStretchTrigger: () {
              return;
            },
            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 24.0, sigmaY: 24.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return FlexibleSpaceBar(
                      background: Container(
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
                      ),
                      stretchModes: [
                        StretchMode.zoomBackground,
                        StretchMode.blurBackground,
                      ],
                      titlePadding: EdgeInsets.all(13.0),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chats',
                            style: TextStyle(
                                fontSize: 54.0,
                                fontWeight: FontWeight.w200,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            cursorWidth: 1.0,
                            cursorColor: Colors.white,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
                            ),
                            cursorHeight: 16.0,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: Colors.white70,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 6.0, horizontal: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, i) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Container(
                    height: 45.0,
                    width: 45.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('images/img$i.jpg'),
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                tileColor: Colors.transparent,
                title:
                    Text('Contact $i', style: TextStyle(color: Colors.white)),
                subtitle: Text('Description $i',
                    style: TextStyle(color: Colors.white70)),
                trailing: Icon(Icons.messenger_outline_sharp),
                onTap: () {},
                enableFeedback: true,
              );
            }, childCount: 20),
          )
        ],
      ),
    );
  }
}
