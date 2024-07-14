// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class providerBrightness extends ChangeNotifier {
//   bool _isDark = false;
//   bool get isDark => _isDark;

//   late SharedPreferences storage;

//   final darkTheme = ThemeData(brightness: Brightness.dark);

//   final lightTheme = ThemeData(brightness: Brightness.light);

//   changeTheme() {
//     _isDark = !_isDark;

//     storage.setBool("isDark", _isDark);
//     notifyListeners();
//   }

//   init() async {
//     storage = await SharedPreferences.getInstance();
//     _isDark = storage.getBool("isDark") ?? false;

//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class providerBrightness extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  late SharedPreferences storage;

  final darkTheme = ThemeData(brightness: Brightness.dark);
  final lightTheme = ThemeData(brightness: Brightness.light);

  providerBrightness() {
    init();
  }

  Future<void> init() async {
    storage = await SharedPreferences.getInstance();
    _isDark = storage.getBool("isDark") ?? false;
    notifyListeners();
  }

  void changeTheme() {
    if (storage != null) {
      _isDark = !_isDark;
      storage.setBool("isDark", _isDark);
      notifyListeners();
    }
  }
}
