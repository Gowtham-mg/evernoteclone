import 'package:evernote/screens/common.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String allNotes = 'all_notes';
  static const String tryEvernote = 'tryEvernote';
  static const String welcome = 'welcome';
  static const String onboarding = 'onboarding';
  static const String newChat = 'new_chat';
  static const String notebooks = 'notebooks';
  static const String susbcriptionOffline = 'susbcription_offline';
  static const String susbcriptionOnline = 'susbcription_online';
  static const String workChat = 'work_chat';
  static const String attributions = 'attributions';
  static const String choosePasscode = 'choose_passcode';
  static const String loginSignup = 'login_signup';
  static const String chooseNotebooks = 'choose_notebooks';
  static const String searchNotes = 'search_notes';
  static const String collectPhotos = 'collect_photos';
  static const String sharedWithMe = 'shared_with_me';
  static const String support = 'support';
  static const String syncc = 'sync';
  static const String tags = 'tags';
  static const String findTag = 'find_tag';
  static const String trash = 'trash';
  //settings screens
  static const String accountInfo = 'account_info';
  static const String cameraSettings = 'camera_settings';
  static const String contextSettings = 'context_settings';
  static const String notebookSettings = 'notebook_settings';
  static const String notesSettings = 'notes_settings';
  static const String notifications = 'notifications';
  static const String searchAndStorage = 'search_and_storage';
  static const String settings = 'settings';
  static const String workChatSettings = 'work_chat_settings';
  static const String exploreEvernote = 'explore_evernote';
  static const String legal = 'legal';
  static const String tutorials = 'tutorials';
  static const String searchNotebooks = 'search_notebooks';

  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.allNotes:
        return MaterialPageRoute(builder: (BuildContext context) => AllNotes());
      case Routes.newChat:
        return MaterialPageRoute(builder: (BuildContext context) => NewChat());
      case Routes.notebooks:
        return MaterialPageRoute(
            builder: (BuildContext context) => AllNotebooks());
      case Routes.susbcriptionOffline:
        return MaterialPageRoute(
            builder: (BuildContext context) => UpgradePlanOffline());
      case Routes.susbcriptionOnline:
        return MaterialPageRoute(
            builder: (BuildContext context) => UpgradePlanOnline());
      case Routes.workChat:
        return MaterialPageRoute(builder: (BuildContext context) => Workchat());
      case Routes.findTag:
        return MaterialPageRoute(builder: (BuildContext context) => FindATag());
      case Routes.collectPhotos:
        return MaterialPageRoute(
            builder: (BuildContext context) => CollectPhotos());
      case Routes.sharedWithMe:
        return MaterialPageRoute(
            builder: (BuildContext context) => SharedWithMe());
      case Routes.welcome:
        return MaterialPageRoute(builder: (BuildContext context) => Welcome());
      case Routes.tryEvernote:
        return MaterialPageRoute(
            builder: (BuildContext context) => TryEvernote());
      case Routes.onboarding:
        return MaterialPageRoute(
            builder: (BuildContext context) => Onboarding());
      case Routes.syncc:
        return MaterialPageRoute(builder: (BuildContext context) => Sync());
      case Routes.support:
        return MaterialPageRoute(builder: (BuildContext context) => Support());
      case Routes.trash:
        return MaterialPageRoute(builder: (BuildContext context) => Trash());
      case Routes.tags:
        return MaterialPageRoute(builder: (BuildContext context) => Tags());
      case Routes.searchNotebooks:
        return MaterialPageRoute(
            builder: (BuildContext context) => SearchNotebooks());
      case Routes.searchNotes:
        return MaterialPageRoute(
            builder: (BuildContext context) => SearchYourNotes());
      case Routes.chooseNotebooks:
        return MaterialPageRoute(
            builder: (BuildContext context) => ChooseNotebook());
      case Routes.attributions:
        return MaterialPageRoute(
            builder: (BuildContext context) => Attributions());
      case Routes.exploreEvernote:
        return MaterialPageRoute(
            builder: (BuildContext context) => ExploreEvernote());
      case Routes.legal:
        return MaterialPageRoute(builder: (BuildContext context) => Legal());
      case Routes.tutorials:
        return MaterialPageRoute(
            builder: (BuildContext context) => Tutorials());
      case Routes.accountInfo:
        return MaterialPageRoute(
            builder: (BuildContext context) => AccountInfo());
      case Routes.cameraSettings:
        return MaterialPageRoute(
            builder: (BuildContext context) => CameraSettings());
      case Routes.contextSettings:
        return MaterialPageRoute(
            builder: (BuildContext context) => ContextSettings());
      case Routes.notebookSettings:
        return MaterialPageRoute(
            builder: (BuildContext context) => NoteBookSettings());
      case Routes.notesSettings:
        return MaterialPageRoute(
            builder: (BuildContext context) => NotesSettings());
      case Routes.notifications:
        return MaterialPageRoute(
            builder: (BuildContext context) => Notifications());
      case Routes.searchAndStorage:
        return MaterialPageRoute(
            builder: (BuildContext context) => SearchAndStorage());
      case Routes.settings:
        return MaterialPageRoute(builder: (BuildContext context) => Settings());
      case Routes.workChatSettings:
        return MaterialPageRoute(
            builder: (BuildContext context) => WorkChatSettings());
      default:
        return MaterialPageRoute(builder: (BuildContext context) => AllNotes());
    }
  }
}
