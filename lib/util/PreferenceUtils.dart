import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future remove(String key) async {
    SharedPreferences prefs = await _prefs;
    await prefs.remove(key);
  }

  static Future putString(String key, String value) async {
    SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
  }

  static Future<String> getString(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  static Future putDouble(String key, double value) async {
    SharedPreferences prefs = await _prefs;
    await prefs.setDouble(key, value);
  }

  static Future<double> getDouble(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.getDouble(key);
  }

  static Future putBoolean(String key, bool value) async {
    SharedPreferences prefs = await _prefs;
    await prefs.setBool(key, value);
  }

  static Future<bool> getBoolean(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.getBool(key);
  }
}
