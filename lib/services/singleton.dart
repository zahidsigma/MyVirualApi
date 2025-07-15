class Singleton {
  static Singleton? _instance;
  static Singleton instance = _instance ??= Singleton();
  Map<String, dynamic> session = {};
}
