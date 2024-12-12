import 'dart:convert';
import 'package:virualapi/models/login.dart';
import 'package:virualapi/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static late SharedPreferences _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String _loginData = "loginData";
  static String _userData = "userData";
  static String _fcmToken = "fcmToken";
  static String session = "session";

  static setLoginData(Login login) async {
    await _preferences.setString(_loginData, jsonEncode(login.toJson()));
  }

  static Login? getLoginData() {
    final String? json = _preferences.getString(_loginData);
    return json == null ? null : Login.fromJson(jsonDecode(json));
  }

  static setUserData(User user) async {
    await _preferences.setString(_userData, jsonEncode(user.toJson()));
  }

  static User? getUserData() {
    final String? json = _preferences.getString(_userData);
    return json == null ? null : User.fromJson(jsonDecode(json));
  }

  static removeUserData() {
    _preferences.remove(_loginData);
  }

  static setFCMToken(String token) async {
    await _preferences.setString(_fcmToken, token);
  }

  static String? getFCMToken() => _preferences.getString(_fcmToken);

  static String? getAuthToken() => getLoginData()?.authToken;

  static void setData(String key, Map<String, dynamic> data) =>
      _preferences.setString(key, jsonEncode(data));

  static Map<String, dynamic> getData(String key) {
    final String? json = _preferences.getString(key);
    return json == null ? {} : jsonDecode(json);
  }

  static void removeData(String key) => _preferences.remove(key);
}
