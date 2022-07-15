import 'package:learnplay/services/socket/socket.dart';
import 'package:socket_io_client/socket_io_client.dart';

class NotificationSocket {

  static final socket = WebsocketServer.socket;

  static void listen() {
    socket.on('getNotification', (data) => streamSocket.addResponse);
  }

  static void sendNotification({required String uuid, required String message, String? description}) {
    socket.emit('sendNotification', {"uuid": uuid, "message": message, "description": description ?? ''});
  }
  
}