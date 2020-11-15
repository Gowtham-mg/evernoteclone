import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/scaffold_with_appbar.dart';
import 'package:flutter/material.dart';

class SharedWithMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppBar(
      title: MetaText.sharedWithMe,
      child: Container(),
      actions: [
        PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text(MetaText.addToHomeScreen),
                  value: MetaText.addToHomeScreen,
                ),
                PopupMenuItem(
                  child: Text(MetaText.sort),
                  value: MetaText.sort,
                ),
                PopupMenuItem(
                  child: Text(MetaText.syncNotes),
                  value: MetaText.syncNotes,
                ),
                PopupMenuItem(
                  child: Text(MetaText.settings),
                  value: MetaText.settings,
                ),
              ];
            })
      ],
    );
  }
}
