import 'package:evernote/screens/all_notes.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String allNotes = 'all_notes';
  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.allNotes:
        return MaterialPageRoute(builder: (BuildContext context) => AllNotes());
      default:
        return MaterialPageRoute(builder: (BuildContext context) => AllNotes());
    }
  }
}
