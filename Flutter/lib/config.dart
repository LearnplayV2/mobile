import 'dart:io';

import 'package:flutter/material.dart';

const String title = "LearnPlay";

class MainTheme {
  static final Color primary = Color.fromRGBO(18, 18, 20, 1);
  static final Color secondary = Color.fromRGBO(32, 31, 36, 1);
  static final Color accent = Color.fromRGBO(22, 163, 74, 1);
  static final Color light = Color.fromRGBO(39, 39, 42, 1);
  static final Color linkPrimary = Color.fromRGBO(77, 131, 155, 1);

  static Text normalText(String text) {
    return Text(text, style: TextStyle(color: Colors.white70));
  }

  static Text h1(String text) {
    return Text(text,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white70));
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