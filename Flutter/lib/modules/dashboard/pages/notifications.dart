import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:learnplay/modules/dashboard/widgets/dashboard_appbar.dart';

class DashboardNotifications extends StatefulWidget {
  const DashboardNotifications({Key? key}) : super(key: key);

  @override
  State<DashboardNotifications> createState() => _DashboardNotificationsState();
}

class _DashboardNotificationsState extends State<DashboardNotifications> {
  @override
  Widget build(BuildContext context) {
    return DashboardBar(
      child: Text("To do"),
    );
  }
}