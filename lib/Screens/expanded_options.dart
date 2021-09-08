import 'dart:ui';
import 'package:flutter/material.dart';

class ExpandedOptions extends StatefulWidget {
  @override
  _ExpandedOptionsState createState() => _ExpandedOptionsState();
}

class _ExpandedOptionsState extends State<ExpandedOptions> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: BouncingScrollPhysics(),
        controller: controller,
        scrollDirection: Axis.vertical,
        itemCount: 11,
        itemBuilder: (context, i) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'images/img$i.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '@username$i',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 24.0),
                            ),
                            Text(
                              'Some Text is written here....',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 24.0),
                            ),
                            Text(
                              'Something here too',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 24.0),
                            ),
                            Text(
                              'Maybe "#" hashtages down here',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 24.0),
                            ),
                            Text(
                              'You can choose whatever goes here',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 24.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          trailing: Text(''),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Icon(
                              Icons.aspect_ratio_rounded,
                              size: 30.0,
                              color: Colors.white,
                            ),
                          ),
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaY: 24.0, sigmaX: 24.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        height: 45.0,
                                        width: 45.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'images/img${19 - i}.jpg'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(
                                        Icons.favorite,
                                        size: 35.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(
                                        Icons.mode_comment,
                                        size: 35.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(
                                        Icons.ios_share,
                                        size: 35.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(
                                        Icons.bookmark,
                                        size: 35.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
