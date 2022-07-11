import 'package:flutter/material.dart';
import 'package:learnplay/modules/dashboard/pages/index.dart';
import 'package:learnplay/modules/home/pages/home.dart';

import 'modules/dashboard/pages/profile.dart';

enum RouteEnum {
  main,
  dashboard,
  dashboardProfile
}

var routes = <String, WidgetBuilder>{
  RouteEnum.main.name: (_) => Home(),
  RouteEnum.dashboard.name:(context) => DashboardIndex(),
  RouteEnum.dashboardProfile.name:(context) => DashboardProfile(),
};