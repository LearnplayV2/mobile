import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as getx;
import 'package:learnplay/bloc/login_bloc/login_bloc.dart';
import 'package:learnplay/bloc/login_bloc/login_bloc_state.dart';
import 'package:learnplay/config.dart';
import 'package:learnplay/modules/home/pages/home.dart';
import 'package:learnplay/routes.dart';
import 'package:learnplay/services/socket/socket.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'bloc/store.dart';
import 'package:asuka/asuka.dart' as asuka;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Store(
        child: getx.GetMaterialApp(
      defaultTransition: getx.Transition.noTransition,
      initialRoute: RouteEnum.main.name,
      routes: routes,
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home: Home(),
      builder: asuka.builder,
      navigatorObservers: [asuka.asukaHeroController],
    ));
  }
}
