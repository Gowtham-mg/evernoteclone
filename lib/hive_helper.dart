import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper{
  static String themeMode = 'themeMode';
  static String darkMode = 'darkMode';
  
  static openBox(String boxName)async{
    await Hive.openBox(boxName);
  }

  static putValue(String boxName, String key, dynamic value){
    var box = Hive.box(themeMode);
    box.put(darkMode, value);
  }

  static bool getValue(String boxName, String key){
    var box = Hive.box(themeMode);
    return box.get(darkMode);
  }
}