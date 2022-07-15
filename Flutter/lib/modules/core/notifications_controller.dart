import 'package:get/get.dart';
import 'package:learnplay/types/notification.dart';

class NotificationsController extends GetxController {
  Rx<List<Notification?>> notifications = Rx<List<Notification>>([]);

  void setNotifications(List<Notification?> event) => this.notifications.value = event;

}