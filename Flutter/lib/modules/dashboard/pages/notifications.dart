import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:learnplay/components/basic_widgets.dart';
import 'package:learnplay/config.dart';
import 'package:learnplay/modules/core/notifications_controller.dart';
import 'package:learnplay/modules/dashboard/widgets/dashboard_appbar.dart';

class DashboardNotifications extends StatefulWidget {
  const DashboardNotifications({Key? key}) : super(key: key);

  @override
  State<DashboardNotifications> createState() => _DashboardNotificationsState();
}

class _DashboardNotificationsState extends State<DashboardNotifications> {
  final _notifications = Get.put(NotificationsController()).notifications;

  @override
  Widget build(BuildContext context) {
    return DashboardBar(
      child: WidgetList.DisplayCenter(context, children: [
        MainTheme.h1("Central de notificações", color: MainTheme.accent),
        SizedBox(height: 20),
        _buildNotificationList()
      ]),
    );
  }

  _buildNotificationList() {
    if (_notifications.value != null && _notifications.value!.length > 0) {
      return Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                _notifications.value!.length,
                (index) => Container(
                      color: MainTheme.lighter,
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                      margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.fiber_manual_record, size: 16, color: (_notifications.value![index].read!) ? Colors.grey : MainTheme.accent),
                              SizedBox(width: 10),
                              Text("${_notifications.value![index].title}",
                              style: TextStyle(fontSize: 13)),
                            ],
                          ),
                          
                          IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.eye, color: Colors.grey, size: 16)),
                        ],
                      ),
                    )),
          ));
    }
    return Container(
      child: Text("Você não possui notificações."),
    );
  }
}
