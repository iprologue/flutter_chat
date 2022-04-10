import 'package:shared_preferences/shared_preferences.dart';

///缓存管理类
class ProCache {
  SharedPreferences? prefs;

  ProCache._() {
    init();
  }

  static ProCache? _instance;

  ProCache._pre(this.prefs);

  ///预初始化，防止在使用get时，prefs还未完成初始化
  static Future<ProCache> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = ProCache._pre(prefs);
    }
    return _instance!;
  }

  static ProCache getInstance() {
    _instance ??= ProCache._();
    return _instance!;
  }

  void init() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  setString(String key, String value) {
    prefs?.setString(key, value);
  }

  setDouble(String key, double value) {
    prefs?.setDouble(key, value);
  }

  setInt(String key, int value) {
    prefs?.setInt(key, value);
  }

  setBool(String key, bool value) {
    prefs?.setBool(key, value);
  }

  setStringList(String key, List<String> value) {
    prefs?.setStringList(key, value);
  }

  remove(String key) {
    prefs?.remove(key);
  }

  T? get<T>(String key) {
    var result = prefs?.get(key);
    if (result != null) {
      return result as T;
    }
    return null;
  }
}
