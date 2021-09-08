import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  bool isDark = true;

  void toggleDone() {
    isDark = !isDark;
  }

  void changeTheme() {
    toggleDone();
    notifyListeners();
  }
}
