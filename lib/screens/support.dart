import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/app_bar_title_with_back_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return ScaffoldWithBackButton(
      title: MetaText.support,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _width * 0.04),
        child: Column(
          children: [
            TextButton(
              child: Text(MetaText.helpAndLearning),
              onPressed: () {
                launch(
                  'https://help.evernote.com/hc/en-us/',
                  enableJavaScript: true,
                  forceWebView: true,
                );
              },
            ),
            TextButton(
              child: Column(
                children: [
                  Text(MetaText.sendActivityLog),
                  Text(MetaText.sendActivityLogDescription),
                ],
              ),
              onPressed: () {},
            ),
            CheckboxListTile(
              title: Text(MetaText.enableMenuToSendNoteLogs),
              isThreeLine: true,
              subtitle: Text(MetaText.enableMenuToSendNoteLogsDescription),
              value: null,
              onChanged: (bool value) {},
            ),
            CheckboxListTile(
              title: Text(MetaText.automaticallySendCrashReports),
              value: null,
              onChanged: (bool value) {},
            ),
          ],
        ),
      ),
    );
  }
}
