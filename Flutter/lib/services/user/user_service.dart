import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:learnplay/services/api_config.dart';
import 'package:learnplay/services/storage/storage.dart';
import 'package:learnplay/types/requestError.dart';
import 'package:learnplay/types/user.dart';

import '../../bloc/login_bloc/login_bloc_event.dart';
import '../../routes.dart';

class UserService {
  static const String _webservice = "$apiUrl/user";

  static Future<String?> login(User user) async {
    try {
      final request =
          await Dio().post("$_webservice/login", data: user.toJson());
      final response = Token.fromJson(request.data);

      Storage.save(Storages.Token, value: response.token!);

      print(await Storage.get(Storages.Token));
    } on DioError catch (err) {
      throw Exception(err.response);
    }
  }

  static Future refresh() async {
    try {
      var token = await Storage.get(Storages.Token);

      print("CHECKING USER DATA.............");

      final response = await Dio().get("$_webservice/refresh",
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return response;
    } on DioError catch (err) {
      throw Exception(err.response);
    }
  }

  static getProfilePicture({required String uuid}) {
    return "$_webservice/get-profile-picture/$uuid";
  }

  static logout(BuildContext context) {
    Storage.remove(Storages.Token);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteEnum.main.name, (route) => false);
  }

  static Future<User?> checkUserLoggedIn(BuildContext context) async {
    try {
      var request = await UserService.refresh();
      var response = User.fromJson(request.data);

      return response;
    } catch (err) {
      Storage.remove(Storages.Token);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteEnum.main.name, (route) => false);
    }
  }
}
