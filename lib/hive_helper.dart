import 'package:hive/hive.dart';

class HiveBoxHelper {
  static String themeMode = 'themeMode';
  static String auth = 'auth';
  static String user = 'user';
  static String notebook = 'notebook';
  static String notes = 'notes';
}

class HiveKeyHelper {
  static String darkMode = 'darkMode';
  static String token = 'token';
  static String userId = 'userId';
  static String onboarding = 'onboarding';
}

class HiveHelper {
  static openBox(String boxName) async {
    Box box = await Hive.openBox(boxName);
    return box;
  }

  static putValue(String boxName, String key, dynamic value) async {
    var box = Hive.box(boxName);
    await box.put(key, value);
  }

  static getValue(String boxName, String key) {
    var box = Hive.box(boxName);
    return box.get(key);
  }

  static deleteValue(String boxName, String key) async {
    var box = Hive.box(boxName);
    await box.delete(key);
  }
}
