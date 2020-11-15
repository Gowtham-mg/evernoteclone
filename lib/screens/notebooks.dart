import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/scaffold_with_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppBar(
      child: Container(),
      title: MetaText.notebooks,
      actions: [
        actionButton(() {}, SvgPicture.asset('assets/notebook-add.svg')),
        actionButton(() {}, Icon(Icons.search)),
        PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text(MetaText.offlineNotebooks),
                value: MetaText.offlineNotebooks,
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
          },
          // items: [
          //   PopupMenuItem(

          //   )
          // ]
        )
      ],
    );
  }

  IconButton actionButton(Function onPressed, Widget icon) => IconButton(
        icon: icon,
        onPressed: onPressed,
      );
}