import 'package:dizzy/Interface/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartOff extends StatelessWidget {
  final PageController controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          AppBarCustom(appBarTitle: 'Chats'),
          AppBarCustom(appBarTitle: 'Groups'),
          AppBarCustom(appBarTitle: 'Calls'),
          AppBarCustom(appBarTitle: 'Status'),
        ],
      ),
    );
  }
}
