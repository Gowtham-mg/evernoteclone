import 'package:evernote/helper/data_connection.dart';
import 'package:evernote/hive_helper.dart';
import 'package:evernote/routes/routes.dart';
import 'package:evernote/screens/all_notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Hive.initFlutter();
  await HiveHelper.openBox(HiveHelper.themeMode);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectionHelperCubit>(
          create: (context) => ConnectionHelperCubit(),
        )
      ],
      child: ValueListenableBuilder(
        valueListenable: Hive.box(HiveHelper.themeMode).listenable(),
        builder: (BuildContext context, box, widget) {
          context.watch<ConnectionHelperCubit>().init();
          bool isDark = box.get(HiveHelper.darkMode) ?? false;
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Colors.green.shade600
            ),
            darkTheme: ThemeData.dark().copyWith(),
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            home: AllNotes(),
            onGenerateRoute: Routes.generateRoutes,
          );
        },
      ),
    );
  }
}

// HiveHelper.putValue(
//     HiveHelper.themeMode,
//     HiveHelper.darkMode,
//     !(HiveHelper.getValue(HiveHelper.themeMode, HiveHelper.darkMode) ??
//         false));
