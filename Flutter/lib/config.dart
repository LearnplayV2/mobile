import 'dart:io';

import 'package:flutter/material.dart';

const String title = "LearnPlay";

TextTheme textThemeDefault() {
  return TextTheme(
    headline1: TextStyle(color: Colors.white),
    headline2: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
    subtitle1: TextStyle(color: Colors.white),
    bodyText1: TextStyle(color: Colors.white),
  );
}

class MainTheme {
  static final Color primary = Color.fromRGBO(18, 18, 20, 1);
  static final Color secondary = Color.fromRGBO(32, 31, 36, 1);
  static final Color accent = Color.fromRGBO(22, 163, 74, 1);
  static final Color light = Color.fromRGBO(39, 39, 42, 1);
  static final Color lighter = Color.fromARGB(255, 49, 49, 53);
  static final Color linkPrimary = Color.fromRGBO(77, 131, 155, 1);

  static Text normalText(String text) {
    return Text(text, style: TextStyle(color: Colors.white70));
  }

  static Text h1(String text, {Color? color, double? size}) {
    return Text(text,
        style: TextStyle(
            fontSize: size ?? 24, fontWeight: FontWeight.bold, color: color ?? Colors.white70));
  }

}

class Display {
  static bool isDesktop() {
    return (Platform.isWindows || Platform.isLinux || Platform.isMacOS);
  }

  static bool isCellphone() {
    return (Platform.isAndroid || Platform.isIOS);
  }
}
