import 'package:dio/dio.dart';
import 'package:learnplay/services/api_config.dart';
import 'package:learnplay/services/storage/storage.dart';
import 'package:learnplay/types/groups/groups.dart';

class GroupService {
  static const String _webservice = "$apiUrl/group";

  static Future<GroupsType?> myGroups({int? page = 1}) async {
    try {
      var token = await Storage.get(StorageType.Token);

      final request = await Dio().get("$_webservice/my/page/${page}", options: Options(headers: {"Authorization": "Bearer $token"}));

      print(request.data);

      final res = request.data;
      final GroupsType response = GroupsType.fromJson(res);

      return response;

    } on DioError catch(err) {
      throw Exception(err.response);
    }
  }
  
}