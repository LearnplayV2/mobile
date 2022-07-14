import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:learnplay/types/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Storages { Token }

class Storage {
  static void save(Storages storageType, {required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(storageType.toString(), value);
  }

  static Future<String?> get(Storages storageType) async {
    final prefs = await SharedPreferences.getInstance();
    return await Future.value(prefs.getString(storageType.toString())) ?? null;
  }

  static void remove(Storages storageType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(storageType.toString());
  }

  static Future<User> getSavedSession() async {
    final token = await Storage.get(Storages.Token);
    final tokenDecoded = JwtDecoder.decode(token!);
    final userData = User.fromJson(tokenDecoded);

    return userData;
  }
}
