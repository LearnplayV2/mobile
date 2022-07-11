import 'package:shared_preferences/shared_preferences.dart';

enum Storages {
  Token
}

class Storage {

  static void save(Storages storageType, {required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    prefs.setString(storageType.toString(), value);
  }

  static Future<String> get(Storages storageType) async {
    final prefs = await SharedPreferences.getInstance();
    return await Future.value(prefs.getString(storageType.toString()));
  }
 
}
