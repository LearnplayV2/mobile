import 'dart:convert';

import 'package:get/get.dart';
import 'package:learnplay/modules/core/notifications_controller.dart';
import 'package:learnplay/types/notification/notification_description.dart';

class NotificationData {
  static final _notificationsController = Get.put(NotificationsController());

  static NotificationDescription getDescriptionDetailsById(int id) {
    final description = json.decode(
        _notificationsController.notifications.value.firstWhere((notification) => notification!.id! == id)!.description!);
    final details = NotificationDescription.fromJson(description);

    return details;
  }

  static NotificationDescription getDescriptionDetails({required int index}) {
    final description = json.decode(
        _notificationsController.notifications.value[index]!.description!);
    final details = NotificationDescription.fromJson(description);

    return details;
  }

  static bool descriptionHasBody({required int index}) {
    final description = json.decode(
        _notificationsController.notifications.value[index]!.description!);
    final details = NotificationDescription.fromJson(description);

    return details.body!.length > 0;
  }
}
