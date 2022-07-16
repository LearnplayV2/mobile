import 'package:dio/dio.dart';
import 'package:learnplay/services/api_config.dart';
import 'package:learnplay/services/storage/storage.dart';
import 'package:learnplay/types/notification/notification.dart';

class NotificationService {

  static const String _webservice = "$apiUrl/user";

  static Future<List<Notification?>> getNotifications() async {
    try {
      var token = await Storage.get(StorageType.Token);

      final request = await Dio().get("$_webservice/notifications",  options: Options(headers: {"Authorization": "Bearer $token"}));

      final res = request.data as List;
      final response = res.map((notification) => Notification.fromJson(notification)).toList();

      return response;
      
    } on DioError catch (err) {
      print(err);
      return [];
    }
  }

  static Future<List<Notification?>> toggleNotification({required int id}) async {
    try {
      var token = await Storage.get(StorageType.Token);

      final request = await Dio().put("$_webservice/notification/toggle/$id",  options: Options(headers: {"Authorization": "Bearer $token"}));

      final res = request.data as List;
      final response = res.map((notification) => Notification.fromJson(notification)).toList();

      return response;
      
    } on DioError catch (err) {
      print(err);
      return [];
    }
  }

  static Future<List<Notification?>> makeAllNotificationsRead() async {
    try {

      var token = await Storage.get(StorageType.Token);

      final request = await Dio().put("$_webservice/notification/makeAllRead",  options: Options(headers: {"Authorization": "Bearer $token"}));

      final res = request.data as List;
      final response = res.map((notification) => Notification.fromJson(notification)).toList();

      print(request.data);

      return response;
      
    } on DioError catch(err) {
      print(err);
      return [];
    }

  }
  
}