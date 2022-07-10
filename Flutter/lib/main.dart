import 'package:flutter/material.dart';
import 'package:learnplay/config.dart';
import 'package:learnplay/modules/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: MainTheme.secondary,
          scaffoldBackgroundColor: MainTheme.primary,
          textTheme: TextTheme(
            headline1: TextStyle(color: Colors.white),
            headline2: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
            subtitle1: TextStyle(color: Colors.white),
          )),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
