import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:learnplay/services/api_config.dart';
import 'package:learnplay/services/storage/storage.dart';
import 'package:learnplay/types/requestError.dart';
import 'package:learnplay/types/user.dart';

class UserService {

  static const String _webservice = "$apiUrl/user"; 

  static Future<String?> login(User user) async {
    try {

      final request = await Dio().post("$_webservice/login", data: user.toJson());
      final response = Token.fromJson(request.data);

      Storage.save(Storages.Token, value: response.token!);

      print(await Storage.get(Storages.Token));
 
    } on DioError catch(err) {
      throw Exception(err.response);
    }
  }
  
}