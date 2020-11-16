import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/app_bar_title_with_back_button.dart';
import 'package:evernote/widgets/common.dart';
import 'package:flutter/material.dart';

class NoteBookSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return ScaffoldWithBackButton(
      title: MetaText.notebooks,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _width*0.04, vertical: 15),
        child: Column(
          children: [
            ListTile(
              title: Text(MetaText.defaultPersonalNotebook),
              //TODO: get selectednotebook
              // subtitle: Text(MetaText.defaultPersonalNotebookDescription),
            ),
            Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(MetaText.offlineNotebooks),
                    Text(MetaText.offlineNotebooksDescription),
                  ],
                ),
              ),
              BorderedButton(
                child: Text(MetaText.upgradeAccount.split(' ')[0].toUpperCase()),
                onPressed: (){},
              )
            ],
          )
          ],
        ),
      ),
    );
  }
}
