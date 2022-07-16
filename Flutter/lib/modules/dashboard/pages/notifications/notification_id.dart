import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:learnplay/modules/dashboard/widgets/dashboard_appbar.dart';

class DashboardNotificationId extends StatefulWidget {
  const DashboardNotificationId({Key? key}) : super(key: key);

  @override
  State<DashboardNotificationId> createState() => _DashboardNotificationIdState();
}

class _DashboardNotificationIdState extends State<DashboardNotificationId> {

  @override
  void initState() {
    super.initState();
    print(Get.arguments);
  }
  
  @override
  Widget build(BuildContext context) {
    return DashboardBar(
      child: Container(
        child: Text("to do"),
      ),
    );
  }
}