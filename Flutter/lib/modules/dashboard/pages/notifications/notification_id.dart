// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnplay/components/basic_widgets.dart';
import 'package:learnplay/config.dart';
import 'package:learnplay/modules/dashboard/pages/member/member_id.dart';
import 'package:learnplay/modules/dashboard/pages/notifications/core/notification_data_controller.dart';
import 'package:learnplay/modules/dashboard/widgets/dashboard_appbar.dart';
import 'package:learnplay/types/notification/notification.dart' as notificationType;
import 'package:learnplay/types/notification/notification_description.dart';
import 'package:learnplay/types/notification/notification_type_enum.dart';

class DashboardNotificationId extends StatefulWidget {

  final notificationType.Notification notification;
  
  DashboardNotificationId({Key? key, required this.notification}) : super(key: key);

  @override
  State<DashboardNotificationId> createState() => _DashboardNotificationIdState();
}

class _DashboardNotificationIdState extends State<DashboardNotificationId> {

  NotificationDescription _notification() => NotificationData.getDescriptionDetailsById(widget.notification.id!);

  @override
  Widget build(BuildContext context) {
    return DashboardBar(
      child: WidgetList.DisplayCenter(
        context,
        children: [
          MainTheme.h1("Notificação:", color: MainTheme.accent),
          SizedBox(height: 25),
          _buildNotificationWidget()
        ]
      ),
    );
  }

  _buildNotificationWidget() {
    if(_notification().type == NotificationTypeEnum.user_profile_visit) {
      return Text.rich(
        TextSpan(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          TextSpan(
            text: "${_notification().data![0]} ", style: TextStyle(color: MainTheme.linkPrimary),
            recognizer: TapGestureRecognizer()..onTap = () {
              Get.to(() => DashboardMemberProfile(), arguments: {"uuid": _notification().data![1]});
            }
          ),
          TextSpan(text: _notification().body, style: TextStyle(fontWeight: FontWeight.bold)),
        ]
      )
      );
    }

    if(_notification().type == NotificationTypeEnum.content) {
      return Text(_notification().body!);
    }
    
    return Container(
      child: Text("Não foi possível obter o conteúdo da notificação."),
    );
  }

}