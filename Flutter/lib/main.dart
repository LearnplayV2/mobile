import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc.dart';
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
    return Store(
      child: GetMaterialApp(
          defaultTransition:  Transition.noTransition,
          initialRoute: RouteEnum.main.name,
          routes: routes,
          theme: ThemeData(
              primaryColor: MainTheme.secondary,
              scaffoldBackgroundColor: MainTheme.primary,
              textTheme: textThemeDefault(),
          ),
          debugShowCheckedModeBanner: false,
          home: Home(),
          builder: EasyLoading.init(),
      )
    );
  }
}
