import 'package:get/get.dart';
import 'package:learnplay/types/notification.dart';

class NotificationsController extends GetxController {
  var notifications = <Notification?>[].obs;

  void setNotifications(List<Notification?> event) => this.notifications.value = event;

}