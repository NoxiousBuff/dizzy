import 'package:dizzy/Interface/snapping_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShowScreen extends StatefulWidget {
  final Color color;
  final String headline;
  final String text;
  ShowScreen({this.text, this.color, this.headline});

  @override
  _ShowScreenState createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    super.initState();
  }

  Widget chatBottomSheet(BuildContext context) {
    return SnappingSheetExample();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF252423),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white54),
                  borderRadius: BorderRadius.circular(100.0)),
              child: ClipRRect(
                child: InkWell(
                  borderRadius: BorderRadius.circular(100.0),
                  onTap: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: ClipOval(
                          child: Image(
                            height: 30.0,
                            width: 30.0,
                            image: AssetImage('images/img2.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 12.0),
                        child: Text(
                          'Samantha',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        leading: Icon(CupertinoIcons.chevron_back),
        brightness: Brightness.dark,
        elevation: 0.0,
        backgroundColor: widget.color ?? Color(0xffa4373a),
        toolbarHeight: 120.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        widget.headline ?? 'Chats',
                        style: TextStyle(
                            fontSize: 48.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.search, color: Colors.white70),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(Icons.ios_share, color: Colors.white70),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(Icons.style, color: Colors.white70),
                        onPressed: () {}),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: ListView.separated(
              separatorBuilder: (context, i) {
                return Divider(
                  indent: 80.0,
                );
              },
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: chatBottomSheet,
                        isScrollControlled: true,
                        isDismissible: true);
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: ClipOval(
                            child: Image(
                              height: 50.0,
                              width: 50.0,
                              image: AssetImage('images/img$i.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Chat $i',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color:
                                          CupertinoColors.lightBackgroundGray),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Something $i',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: CupertinoColors.inactiveGray),
                                    ),
                                    Text(
                                      'Time $i',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: CupertinoColors.inactiveGray),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
