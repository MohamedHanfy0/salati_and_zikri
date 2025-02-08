import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ServicesSharedPreferences {
  static late SharedPreferences sharedPreferences;

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveData(String key, dynamic saveData) async {
    if (saveData.runtimeType == String) {
      await sharedPreferences.setString(key, saveData);
    } else if (saveData.runtimeType == bool) {
      await sharedPreferences.setBool(key, saveData);
    } else if (saveData.runtimeType == int) {
      await sharedPreferences.setInt(key, saveData);
    }
  }

  Future<void> saveJsonData(String key, List azkr) async {
    String azkari = jsonEncode(azkr);
    await sharedPreferences.setString(key, azkari);
  }

  getJsonData(String key) {
    String? azkariDecode = sharedPreferences.getString(key);

    if (azkariDecode != null) {
      return jsonDecode(azkariDecode);
    } else {
      return [];
    }
  }

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }
}
