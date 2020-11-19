import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:evernote/blocs/all_notes_cubit.dart';
import 'package:evernote/blocs/drawer_cubit.dart';
import 'package:evernote/blocs/login_signup/login_ui.dart';
import 'package:evernote/blocs/data_connection.dart';
import 'package:evernote/blocs/onboarding_cubit.dart';
import 'package:evernote/hive_helper.dart';
import 'package:evernote/models/note.dart';
import 'package:evernote/models/notebook.dart';
import 'package:evernote/repository/login.dart';
import 'package:evernote/repository/login_token.dart';
import 'package:evernote/repository/user.dart';
import 'package:evernote/routes/routes.dart';
import 'package:evernote/screens/auth/login_signup.dart';
import 'package:evernote/screens/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:evernote/models/user.dart' as userModel;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Note>(NoteAdapter());
  Hive.registerAdapter<Notebook>(NotebookAdapter());
  Hive.registerAdapter<userModel.User>(userModel.UserAdapter());
  await Hive.openBox(HiveBoxHelper.themeMode);
  await Hive.openBox(HiveBoxHelper.auth);
  await Hive.openBox(HiveBoxHelper.user);
  await Hive.openBox(HiveBoxHelper.notes);
  await Hive.openBox(HiveBoxHelper.notebook);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  bool _isConnected = await DataConnectionChecker().hasConnection;
  runApp(MyApp(
    isConnected: _isConnected,
  ));
}

class MyApp extends StatelessWidget {
  final bool isConnected;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final userBox = Hive.box(HiveBoxHelper.user);

  MyApp({
    Key key,
    @required this.isConnected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final LoginTokenRepository loginTokenRepository = LoginTokenRepository();
    final UserRepository userRepository =
        FirebaseUserRepository(loginTokenRepository);
    final LoginRepository loginRepository = LoginFirebaseRepository(
        loginTokenRepository, userRepository, firebaseAuth);
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectionHelperCubit>(
          create: (context) => ConnectionHelperCubit(isConnected),
        ),
        BlocProvider<LoginUiCubit>(
          create: (context) =>
              LoginUiCubit(loginRepository, firebaseAuth, firestore, userBox),
        ),
        BlocProvider<OnboardingCubit>(
          create: (context) => OnboardingCubit(HiveHelper.getValue(
                  HiveBoxHelper.auth, HiveKeyHelper.onboarding) ??
              1),
        ),
        BlocProvider<DrawerCubit>(create: (context)=> DrawerCubit()),
        BlocProvider<TabSelectedCubit>(create: (context)=> TabSelectedCubit()),
        BlocProvider<AllNotesSelectedCubit>(create: (context)=> AllNotesSelectedCubit()),
        
      ],
      child: Builder(
        builder: (BuildContext context) => ValueListenableBuilder(
          valueListenable: Hive.box(HiveBoxHelper.themeMode).listenable(),
          builder: (BuildContext context, box, widget) {
            context.watch<ConnectionHelperCubit>().init();
            bool isDark = box.get(HiveKeyHelper.darkMode) ?? false;
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
              home: LoginSignup(),
              onGenerateRoute: Routes.generateRoutes,
              theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  // primary icons theme
                  primaryIconTheme:
                      IconThemeData(color: Colors.grey.shade800, size: 22),
                  textTheme: TextTheme(
                    // plan limit darkgrey
                    headline4: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 18
                      ),
                    headline1: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    // All Notes screen day style 12/04/2020
                    headline6: TextStyle(color: Colors.grey, fontSize: 14),
                    // All Notes month year style NOVEMBER 2020
                    bodyText1: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
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
                      fontSize: 18,
                    ),
                    //Button white text
                    button: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    // try for free black normal text
                    caption: TextStyle(color: Colors.black, fontSize: 16),
                    // feature items normal text
                    subtitle2: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  primaryTextTheme: TextTheme(
                      // force premium subscription
                      headline2: TextStyle(color: Colors.black, fontSize: 24),
                      caption: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                      ),
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
                          height: 1.25),
                      //drawer email
                      subtitle2: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      headline1: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.w700)),
                  accentColor: Colors.green,
                  dividerColor: Colors.grey,
                  accentIconTheme:
                      IconThemeData(color: Colors.grey.shade700, size: 22),
                  appBarTheme: AppBarTheme(
                      iconTheme:
                          IconThemeData(color: Colors.grey.shade800, size: 19),
                      color: Colors.grey.shade50,
                      textTheme: TextTheme(
                        headline6: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ))),
              darkTheme: ThemeData.dark().copyWith(
                  scaffoldBackgroundColor: Colors.black,
                  primaryIconTheme:
                      IconThemeData(color: Colors.white, size: 22),
                  accentIconTheme:
                      IconThemeData(color: Colors.grey.shade700, size: 22),
                  primaryTextTheme: TextTheme(
                    // force premium subscription
                    headline2: TextStyle(color: Colors.black, fontSize: 24),
                    headline1: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w700),
                    caption: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),
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
                        height: 1.25),
                    //drawer email
                    subtitle2: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  textTheme: TextTheme(
                    // plan limit darkgrey
                    headline4: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 18
                      ),
                    headline1: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    // All Notes screen day style 12/04/2020
                    headline6: TextStyle(color: Colors.grey, fontSize: 14),
                    // All Notes month year style NOVEMBER 2020
                    bodyText1: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
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
                      fontSize: 18,
                    ),
                    // button text
                    button: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    // try for free black bold normal text
                    caption: TextStyle(color: Colors.black, fontSize: 16),
                    // feature items normal text
                    subtitle2: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  dividerColor: Colors.grey.shade200,
                  accentColor: Colors.green.shade600,
                  appBarTheme: AppBarTheme(
                      iconTheme: IconThemeData(color: Colors.grey.shade300, size: 19),
                      color: ThemeData.dark().primaryColorDark,
                      textTheme: TextTheme(
                        headline6: TextStyle(
                          color: Colors.white.withOpacity(0.75),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ))),
            );
          },
        ),
      ),
    );
  }
}
