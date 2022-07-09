import 'package:flutter/material.dart';

const String title = "LearnPlay";

class MainTheme {
  static final Color primary = Color.fromRGBO(18, 18, 20, 1);
  static final Color secondary = Color.fromRGBO(32, 31, 36, 1);
  static final Color accent = Color.fromRGBO(34, 197, 94, 1);
  static final Color light = Color.fromRGBO(39, 39, 42, 1);

  static Text h1(String text) {
    return Text(text,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold));
  }
}
