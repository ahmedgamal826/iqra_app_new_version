import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Color quranPagesColor = Color(0xffF1EEE5);

const Color orangeColor = Colors.orange;

const Color blackColor = Colors.black;

const blueColor = Colors.blueAccent;

double arabicFontSize = 28;

Future saveSettings() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('arabicFontSize', arabicFontSize.toInt());
}

Future getSettings() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    arabicFontSize = await prefs.getInt('arabicFontSize')!.toDouble();
  } catch (_) {
    arabicFontSize = 25; //
  }
}
