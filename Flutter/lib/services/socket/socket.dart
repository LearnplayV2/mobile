import 'dart:async';
import 'dart:convert';

import 'package:learnplay/services/api_config.dart';
import 'package:learnplay/services/socket/notification.dart';
import 'package:learnplay/services/storage/storage.dart';
import 'package:socket_io_client/socket_io_client.dart';

class StreamSocket {
  final socketController = StreamController<String>();

  void addResponse({required String event, dynamic data}) => socketController.sink.add(json.encode({'event': event, 'data': data}));

  Stream<String> get getResponse => socketController.stream;

  // void dispose() {
  //   socketController.close();
  // }
}

class WebsocketServer {
  static final socket =
      io(socketUrl, OptionBuilder().setTransports(['websocket']).build());

  static void addNewUser({required String uuid}) {
    socket.emit('newUser', uuid);
  }

  static void connectAndListen() {
    socket.onConnect((_) async {
      final session = await Storage.getSavedSession();
      addNewUser(uuid: session.uuid!);
    });

    NotificationSocket.listen();
  }
}

StreamSocket streamSocket = StreamSocket();
