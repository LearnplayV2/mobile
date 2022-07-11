import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnplay/config.dart';
import 'package:learnplay/modules/home/pages/home.dart';

import 'bloc/counter_bloc/counter_bloc.dart';
import 'bloc/store.dart';

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
      home: Store(child: Home())
    );
  }
}
