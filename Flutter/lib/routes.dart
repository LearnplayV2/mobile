import 'package:flutter/material.dart';
import 'package:learnplay/modules/dashboard/pages/index.dart';
import 'package:learnplay/modules/dashboard/pages/notifications.dart';
import 'package:learnplay/modules/home/pages/404.dart';
import 'package:learnplay/modules/home/pages/home.dart';

import 'modules/dashboard/pages/profile.dart';

// only main routes
enum RouteEnum { main, dashboard }

var routes = {
  RouteEnum.main.name: (_) => Home(),
  RouteEnum.dashboard.name: (context) => DashboardIndex(),
};