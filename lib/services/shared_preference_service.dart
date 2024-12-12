import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;

  static Future<SharedPreferencesService> getInstance(
      {bool enableLogs = false}) async {
    _instance ??= SharedPreferencesService._(
      await SharedPreferences.getInstance(),
      enableLogs,
    );
    return _instance!;
  }

  final bool enableLogs;

  final SharedPreferences _preferences;
  SharedPreferencesService._(
    this._preferences,
    this.enableLogs,
  );

  static const _defaultDatabaseVersionKey = 'database_version_key';
  String? _databaseVersionKey;

  String get databaseVersionKey =>
      _databaseVersionKey ?? _defaultDatabaseVersionKey;

  set databaseVersionKey(String? key) => _databaseVersionKey = key;

  int get databaseVersion => _getFromDisk(databaseVersionKey) ?? 0;

  set databaseVersion(int value) => _saveToDisk(databaseVersionKey, value);

  bool get databaseGetBool => _getFromDisk(databaseVersionKey) ?? true;

  set databaseGetBool(bool value) => _saveToDisk(databaseVersionKey, value);

  bool get isAppNewNotification => _getFromDisk(databaseVersionKey) ?? false;

  set isAppNewNotification(bool value) =>
      _saveToDisk(databaseVersionKey, value);

  String? get activatedViewSubscriptionId => _getFromDisk(databaseVersionKey);

  set activatedViewSubscriptionId(String? value) =>
      _saveToDisk(databaseVersionKey, value);

  void clearPreferences() {
    _preferences.clear();
  }

  dynamic _getFromDisk(String key) {
    var value = _preferences.get(key);
    if (enableLogs) log('key:$key value:$value');
    return value;
  }

  void _saveToDisk(String key, dynamic content) {
    if (enableLogs) log('key:$key value:$content');

    if (content == null) {
      _preferences.remove(key);
      return;
    }

    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }
}
