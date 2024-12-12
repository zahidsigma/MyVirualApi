class Singleton {
  static Singleton? _instance;
  static Singleton instance = _instance ??= new Singleton();
  Map<String, dynamic> session = {};
}
