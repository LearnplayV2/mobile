import 'package:get/get.dart';
import 'package:learnplay/modules/core/notifications_controller.dart';
import 'package:learnplay/services/socket/socket.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../types/notification/notification.dart';

class NotificationSocket {

  static final _notificationController = Get.put(NotificationsController());
  static final socket = WebsocketServer.socket;

  static void listen() {
    socket.on('getNotification', (event) {
      final evList = event as List;
      final data = evList.map((e) => Notification.fromJson(e)).toList();
      _notificationController.setNotifications(data);
    });
  }

  static void sendNotification({required String uuid, required String message, dynamic? description}) {
    socket.emit('sendNotification', {"uuid": uuid, "message": message, "description": description ?? ''});
  }
  
}