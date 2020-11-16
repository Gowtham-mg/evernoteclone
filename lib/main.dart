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
              scaffoldBackgroundColor: Colors.white,
              // primary icons theme
              primaryIconTheme: IconThemeData(
                color: Colors.white,
                size: 22
              ),
              textTheme: TextTheme(
                headline1: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                // All Notes screen day style 12/04/2020
                headline6: TextStyle(
                  color: Colors.grey,
                  fontSize: 14
                ),
                // All Notes month year style NOVEMBER 2020
                bodyText1: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
                // All Notes note overview style
                bodyText2: TextStyle(
                  color: Colors.black,
                  height: 1.5,
                  fontSize: 16,
                  wordSpacing: 1.5,
                ),
                // All Notes note title overview style
                headline5: TextStyle(
                  color: Colors.black87,
                  height: 2,
                  fontSize: 18.5,
                ),
                //Button white text
                button: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              primaryTextTheme: TextTheme(
                //button text blue
                button: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                // cards title
                headline6: TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
                // cards description
                headline5: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  wordSpacing: 1.5,
                  height: 1.25
                ),
              ),
              accentColor: Colors.green,
              dividerColor: Colors.grey,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.grey.shade800,
                  size: 19
                ),
                color: Colors.white70,
                textTheme: TextTheme(
                  headline6: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              )
            ),
            darkTheme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: Colors.black,
              primaryIconTheme: IconThemeData(
                color: Colors.white,
                size: 22
              ),
              primaryTextTheme: TextTheme(
                //button text blue
                button: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                // cards title
                headline6: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
                // cards description
                headline5: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  wordSpacing: 1.5,
                  height: 1.25
                ),
              ),
              textTheme: TextTheme(
                headline1: TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                // All Notes screen day style 12/04/2020
                headline6: TextStyle(
                  color: Colors.grey,
                  fontSize: 14
                ),
                // All Notes month year style NOVEMBER 2020
                bodyText1: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
                // All Notes note overview style
                bodyText2: TextStyle(
                  color: Colors.white,
                  height: 1.5,
                  fontSize: 16,
                  wordSpacing: 1.5,
                ),
                // All Notes note title overview style
                headline5: TextStyle(
                  color: Colors.white,
                  height: 2,
                  fontSize: 18.5,
                ),
                // button text
                button: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              dividerColor: Colors.grey.shade200,
              accentColor: Colors.green.shade600,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.grey,
                  size: 19
                ),
                color: ThemeData.dark().primaryColorDark,
                textTheme: TextTheme(
                  headline6: TextStyle(
                    color: Colors.white.withOpacity(0.75),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              )
            ),
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            home: AllNotes(),
            onGenerateRoute: Routes.generateRoutes,
          );
        },
      ),
    );
  }
}
