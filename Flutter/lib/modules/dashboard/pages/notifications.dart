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

import '../../../services/user/notification_service.dart';

class DashboardNotifications extends StatefulWidget {
  const DashboardNotifications({Key? key}) : super(key: key);

  @override
  State<DashboardNotifications> createState() => _DashboardNotificationsState();
}

class _DashboardNotificationsState extends State<DashboardNotifications> {
  final _notificationsController = Get.put(NotificationsController());

  _toggleNotification({required int id}) async {
    _notificationsController
        .setNotifications(await NotificationService.toggleNotification(id: id));
  }

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
      return Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: (_notificationsController.notifications.value.isEmpty) ? [Container(
      child: Text("Você não possui notificações."))] : List.generate(
                _notificationsController.notifications.value.length,
                (index) => Container(
                      color: MainTheme.lighter,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () => _toggleNotification(
                                  id: _notificationsController
                                      .notifications.value[index]!.id!),
                              icon: (_notificationsController
                                      .notifications.value[index]!.read!)
                                  ? FaIcon(FontAwesomeIcons.eye,
                                      color: Colors.grey, size: 16)
                                  : FaIcon(FontAwesomeIcons.eyeSlash,
                                      color: Colors.grey, size: 16)),
                          SizedBox(width: 16),
                          Text(
                              "${_notificationsController.notifications.value[index]!.title}",
                              style: TextStyle(fontSize: 13)),
                        ],
                      ),
                    )),
          ));
  }
}
