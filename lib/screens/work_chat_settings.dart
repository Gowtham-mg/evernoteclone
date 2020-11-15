import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/app_bar_title_with_back_button.dart';
import 'package:flutter/material.dart';

class WorkChatSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackButton(
      title: MetaText.workChat,
      child: CheckboxListTile(
        title: Text(MetaText.showWorkChat),
        subtitle: Text(MetaText.showWorkChatDescription),
        isThreeLine: true,
        value: null,
        onChanged: (bool value) {},
      ),
    );
  }
}
