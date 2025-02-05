import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/app/utils/app_logger.dart';

class Preferences {
  SharedPreferences? _prefs;

  Preferences._private();

  static final _instance = Preferences._private();

  factory Preferences() {
    return _instance;
  }

  /// Initialize SharedPreferences (MUST be awaited before use)
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Get value from SharedPreferences
  Object? getValue(String key) {
    return _prefs?.get(key);
  }

  /// Set value in SharedPreferences
  Future<void> setValue(String key, dynamic value) async {
    if (value is String) {
      await _prefs?.setString(key, value);
    } else if (value is int) {
      await _prefs?.setInt(key, value);
    } else if (value is double) {
      await _prefs?.setDouble(key, value);
    } else if (value is bool) {
      await _prefs?.setBool(key, value);
    } else if (value is List<String>) {
      await _prefs?.setStringList(key, value);
    } else {
      await _prefs?.setString(key, value.toString());
      AppLogger.info("Unsupported type, saved as string.");
    }
  }

  bool getBool(String key) => _prefs?.getBool(key) ?? false;
  double getDouble(String key) => _prefs?.getDouble(key) ?? 0;
  int getInt(String key) => _prefs?.getInt(key) ?? 0;
  String getString(String key) => _prefs?.getString(key) ?? "";
  List<String>? getStringList(String key) => _prefs?.getStringList(key);

  Future<bool> removeEntry(String key) async {
    return await _prefs?.remove(key) ?? false;
  }
}
