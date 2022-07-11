import 'package:flutter/material.dart';
import 'package:learnplay/config.dart';
import 'package:learnplay/modules/home/pages/home.dart';
import 'package:learnplay/routes.dart';
import 'bloc/store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: RouteEnum.main.name,
        routes: routes,
        theme: ThemeData(
            primaryColor: MainTheme.secondary,
            scaffoldBackgroundColor: MainTheme.primary,
            textTheme: TextTheme(
              headline1: TextStyle(color: Colors.white),
              headline2: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white),
              subtitle1: TextStyle(color: Colors.white),
              bodyText1: TextStyle(color: Colors.white),
            )),
        debugShowCheckedModeBanner: false,
        home: Store(child: Home()));
  }
}
