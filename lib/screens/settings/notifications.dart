import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/app_bar_title_with_back_button.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackButton(
      title: MetaText.notifications,
      child: ListView(
        children: [
          Text(MetaText.quickNote),
          CheckboxListTile(
            title: Text(MetaText.addNotesFromNotificationBar),
            subtitle: Text(MetaText.addNotesFromNotificationBar),
            isThreeLine: true,
            value: null,
            onChanged: (bool value) {},
          ),
          Text(MetaText.collectDocuments),
          CheckboxListTile(
            title: Text(MetaText.collectNotifications),
            subtitle: Text(MetaText.collectNotificationsDescription),
            isThreeLine: true,
            value: null,
            onChanged: (bool value) {},
          ),
          Text(MetaText.workChat),
          CheckboxListTile(
            title: Text(MetaText.inAppChatNotifications),
            subtitle: Text(MetaText.inAppChatNotificationsDescription),
            isThreeLine: true,
            value: null,
            onChanged: (bool value) {},
          ),
          CheckboxListTile(
            title: Text(MetaText.chatNotificationSound),
            subtitle: Text(MetaText.chatNotificationSoundDesription),
            isThreeLine: true,
            value: null,
            onChanged: (bool value) {},
          ),
          CheckboxListTile(
            title: Text(MetaText.chatNotificationVibration),
            subtitle: Text(MetaText.chatNotificationVibrationDescription),
            isThreeLine: true,
            value: null,
            onChanged: (bool value) {},
          ),
        ],
      ),
    );
  }
}
