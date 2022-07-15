import 'dart:async';

import 'package:learnplay/services/api_config.dart';
import 'package:learnplay/services/socket/notification.dart';
import 'package:learnplay/services/storage/storage.dart';
import 'package:socket_io_client/socket_io_client.dart';

class StreamSocket {
  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
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
