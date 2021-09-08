import 'package:dizzy/Interface/app_bar_dark.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

Color randomColors() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

Color color = randomColors();

class SliverApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 50.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              title: Container(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'SliverAppBar',
                  style: TextStyle(fontSize: 16.0),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.deepPurple[200].withOpacity(0.5),
                ),
              ),
              backgroundColor: Colors.deepPurple[200].withOpacity(0.8),
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'images/img2.jpg',
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.color,
                ),
                collapseMode: CollapseMode.parallax,
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 80.0,
              delegate: SliverChildBuilderDelegate(
                (context, i) {
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
                    title: Text('Contact $i'),
                    subtitle: Text('Description $i'),
                    trailing: Icon(Icons.messenger_outline_sharp),
                    onTap: () {},
                    enableFeedback: true,
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
