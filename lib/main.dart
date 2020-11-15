import 'package:evernote/hive_helper.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await HiveHelper.openBox(HiveHelper.themeMode);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(HiveHelper.themeMode).listenable(),
      builder: (BuildContext context, box, widget) {
        bool isDark = box.get(HiveHelper.darkMode) ?? false;
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData.dark().copyWith(),
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}


    // HiveHelper.putValue(
    //     HiveHelper.themeMode,
    //     HiveHelper.darkMode,
    //     !(HiveHelper.getValue(HiveHelper.themeMode, HiveHelper.darkMode) ??
    //         false));
