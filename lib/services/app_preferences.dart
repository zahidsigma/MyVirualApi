import 'dart:convert';
import 'package:virualapi/models/login.dart';
import 'package:virualapi/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virualapi/services/firebase_service.dart';

class AppPreferences {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  final FirebaseService _firebaseService = FirebaseService();
  static const String _loginData = "loginData";
  static const String _userData = "userData";
  static const String _fcmToken = "fcmToken";
  static const String session = "session";

  // Set Login Data
  // static Future<void> setLoginData(Login login) async {
  //   try {
  //     print("Saving login data: ${login.toJson()}"); // Debug print
  //     await _preferences.setString(_loginData, jsonEncode(login.toJson()));
  //   } catch (e) {
  //     print("Error saving login data: $e");
  //   }
  // }

  static Future<void> setLoginData(Login login) async {
    try {
      final jsonString = jsonEncode(login.toJson());
      await _preferences.setString(_loginData, jsonString);
      print("Saved login data: $jsonString");
    } catch (e) {
      print("Error saving login data: $e");
    }
  }

  static bool isLoggedIn() {
    final token = getAuthToken(); // or however you store tokens
    return token != null && token.isNotEmpty;
  }

  // static bool isLoggedIn() {
  //   final firebaseUser = _firebaseService?.currentUser;
  //   final token = getAuthToken(); // your own stored token

  //   return firebaseUser != null || (token != null && token.isNotEmpty);
  // }

  // Get Login Data
  // static Login? getLoginData() {
  //   try {
  //     final String? json = _preferences.getString(_loginData);
  //     if (json == null) {
  //       print("No login data found.");
  //       return null;
  //     }
  //     final login = Login.fromJson(jsonDecode(json));
  //     print("Login data loaded: $login");
  //     return login;
  //   } catch (e) {
  //     print("Error loading login data: $e");
  //     return null;
  //   }
  // }

  static Login? getLoginData() {
    try {
      final jsonString = _preferences.getString(_loginData);
      if (jsonString == null) return null;

      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return Login.fromJson(jsonMap);
    } catch (e) {
      print("Error reading login data: $e");
      return null;
    }
  }

  // Save only the actual user data (not the full UserResponse)
  // static Future<void> setUserData(User user) async {
  //   try {
  //     final userJson = user.toJson();
  //     print("Saving user data: $userJson");
  //     await _preferences.setString(_userData, jsonEncode(userJson));
  //   } catch (e) {
  //     print("Error saving user data: $e");
  //   }
  // }

  static Future<void> setUserData(Map<String, dynamic> userJson) async {
    try {
      print("Saving user data: $userJson");
      await _preferences.setString(_userData, jsonEncode(userJson));
    } catch (e) {
      print("Error saving user data: $e");
    }
  }

  static User? getUserData() {
    try {
      final jsonString = _preferences.getString(_userData);
      if (jsonString != null) {
        final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
        return User.fromJson(jsonMap);
      } else {
        print("No user data found in SharedPreferences.");
      }
    } catch (e) {
      print("Error loading user data: $e");
    }
    return null;
  }

  // Remove Login Data
  static Future<void> removeLoginData() async {
    await _preferences.remove(_loginData);
  }

  // Remove User Data
  static Future<void> removeUserData() async {
    await _preferences.remove(_userData);
  }

  // Clear all user-related data
  static Future<void> clearUserData() async {
    await _preferences.remove(_loginData);
    await _preferences.remove(_userData);
    await _preferences.remove(_fcmToken); // Optionally clear FCM token too
  }

  // Set FCM Token
  static Future<void> setFCMToken(String token) async {
    await _preferences.setString(_fcmToken, token);
  }

  // Get FCM Token
  static String? getFCMToken() => _preferences.getString(_fcmToken);

  // Get Auth Token (from login data)
  static String? getAuthToken() {
    try {
      final loginData = getLoginData();
      if (loginData == null) {
        print("No login data found, cannot fetch token.");
        return null;
      }
      final token = loginData.token;
      print("Login data token: $token");
      return token;
    } catch (e) {
      print("Error getting auth token: $e");
      return null;
    }
  }

  // Set generic data
  static Future<void> setData(String key, Map<String, dynamic> data) async {
    try {
      await _preferences.setString(key, jsonEncode(data));
    } catch (e) {
      print("Error saving data: $e");
    }
  }

  // Get generic data
  static Map<String, dynamic> getData(String key) {
    try {
      final String? json = _preferences.getString(key);
      return json == null ? {} : jsonDecode(json);
    } catch (e) {
      print("Error loading data: $e");
      return {};
    }
  }

  // Remove generic data
  static Future<void> removeData(String key) async {
    await _preferences.remove(key);
  }
}
