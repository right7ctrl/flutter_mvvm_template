import 'package:shared_preferences/shared_preferences.dart';

const String TOKEN_KEY = 'token_key';
const String THEME_KEY = 'theme_mode';

class StorageManager {
  static Future<SharedPreferences> get _instance async => _prefs ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefs;

  // call this method from initState() function of mainApp.
  static Future<SharedPreferences> initPrefs() async {
    _prefs = await _instance;
    return _prefs!;
  }

  static String? getString(String key, [String? defValue]) {
    return _prefs!.getString(key);
  }

  static String? getThemeMode() {
    return _prefs?.getString(THEME_KEY);
  }

  static setThemeMode(String mode) {
    _prefs!.setString(THEME_KEY, mode);
  }

  static int? getInt(String key) {
    return _prefs!.getInt(key);
  }

  static bool get auth {
    String? token = _prefs!.getString(TOKEN_KEY);
    return token != null && token != '';
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static Future<bool> isKeyExist(String key) async {
    var prefs = await _instance;
    return prefs.containsKey(key);
  }

  static Future<void> clearAuth() async {
    var prefs = await _instance;
    prefs.remove(TOKEN_KEY);
    return;
  }

  static Future<void> clearKey(String key) async {
    var prefs = await _instance;
    prefs.remove(key);
    return;
  }

  static void clearAll() {
    _prefs!.clear();
  }
}
