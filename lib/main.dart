import 'package:dizzy/Interface/app_bar_dark.dart';
import 'package:dizzy/Screens/karan_canvas.dart';
import 'package:dizzy/fluent/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dizzy/Screens/theme_data.dart';
import 'Animations/confetti_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      builder: (context, i) {
        return MaterialApp(
          // theme: Provider.of<Data>(context).isDark
          //     ? ThemeData.dark().copyWith(
          //         textTheme: TextTheme(
          //           headline2: TextStyle(
          //               fontSize: 20.0,
          //               fontFamily: 'QuickSand',
          //               fontWeight: FontWeight.bold,
          //               color: Colors.white),
          //           headline3: TextStyle(
          //               fontSize: 18.0,
          //               fontFamily: 'QuickSand',
          //               color: Colors.white60),
          //         ),
          //         scaffoldBackgroundColor: Colors.black)
          //     : ThemeData.light(),

          // theme: ThemeData.light().copyWith(
          //     textTheme: TextTheme(
          //       headline2: TextStyle(
          //           fontSize: 20.0,
          //           fontFamily: 'QuickSand',
          //           fontWeight: FontWeight.bold,
          //           color: Colors.black),
          //       headline3: TextStyle(
          //           fontSize: 18.0,
          //           fontFamily: 'QuickSand',
          //           color: Colors.black54),
          //     ),
          //     scaffoldBackgroundColor: Colors.white),
          theme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          // home: isTrue ? ComplexSettings() : NotificationSettings(),
          home: AppBarCustomDark(),
        );
      },
    );
  }
}
