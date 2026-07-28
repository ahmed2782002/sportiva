// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Set<String> getKeys() {
    return sharedPreferences.getKeys();
  }

  static String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  static int getInt(String key, {int defaultValue = 0}) {
    return sharedPreferences.getInt(key) ?? defaultValue;
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    return sharedPreferences.getBool(key) ?? defaultValue;
  }

  static double getDouble(String key, {double defaultValue = 0.0}) {
    return sharedPreferences.getDouble(key) ?? defaultValue;
  }

  static List<String>? getStringList(String key) {
    return sharedPreferences.getStringList(key);
  }

  static Map<String, dynamic> getJSON(
    String key, {
    Map<String, dynamic>? defaultValue,
  }) {
    if (sharedPreferences.containsKey(key) &&
        sharedPreferences.getString(key)!.isNotEmpty) {
      return jsonDecode(sharedPreferences.getString(key)!);
    } else {
      return defaultValue ?? {};
    }
  }

  static List<String> getMatchingSharedPrefKeys(String key) {
    List<String> keys = [];

    sharedPreferences.getKeys().forEach((element) {
      if (element.contains(key)) {
        keys.add(element);
      }
    });
    return keys;
  }

  static Future<bool> saveData(
    String key,
    dynamic value, {
    bool log1 = false,
  }) async {
    if (log1) {
      assert(() {
        debugPrint('${value.runtimeType} - $key - $value');
        return true;
      }());
    }

    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else if (value is Map<String, dynamic>) {
      return await sharedPreferences.setString(key, jsonEncode(value));
    } else if (value is List<String>) {
      return await sharedPreferences.setStringList(key, value);
    } else {
      throw ArgumentError(
        'Invalid value ${value.runtimeType} - Must be a String, int, bool, double, Map<String, dynamic> or StringList',
      );
    }
  }

  static Future<bool> removeData(String key) async {
    return await sharedPreferences.remove(key);
  }

  static Future<bool> clear() async {
    return await sharedPreferences.clear();
  }
}
