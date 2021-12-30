import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData({required String key, required bool date}) async {
    return await sharedPreferences!.setBool(key, date);
  }

  static bool? getData({required String key}) {
    return sharedPreferences!.getBool(key);
  }
}
