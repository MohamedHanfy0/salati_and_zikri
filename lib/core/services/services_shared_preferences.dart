import 'dart:convert';

import 'package:islami/features/hadith/model/azkari_model.dart';
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

  Future<void> saveAzkari(List<Map<String, dynamic>> azkr) async {
    String azkari = jsonEncode(azkr);
    await sharedPreferences.setString('azkari', azkari);
  }

  getAzkari() {
    
    String? azkariDecode = sharedPreferences.getString('azkari');

    if (azkariDecode != null) {
      return jsonDecode(azkariDecode);
    }
    return null;
  }

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }
}
