import 'package:hive/hive.dart';

class HiveHelper {
  static String themeMode = 'themeMode';
  static String darkMode = 'darkMode';
  static String auth = 'auth';
  static String token = 'token';
  static String userId = 'userId';

  static openBox(String boxName) async {
    await Hive.openBox(boxName);
  }

  static putValue(String boxName, String key, dynamic value) async {
    var box = Hive.box(boxName);
    await box.put(key, value);
  }

  static getValue(String boxName, String key) {
    var box = Hive.box(boxName);
    return box.get(key);
  }

  static deleteValue(String boxName, String key) async{
    var box = Hive.box(boxName);
    await box.delete(key);
  }
}
