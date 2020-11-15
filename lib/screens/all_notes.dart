import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/scaffold_with_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppBar(
      child: Container(),
      title: MetaText.allNotes,
      actions: [
        actionButton(() {}, SvgPicture.asset('assets/flash.svg')),
        actionButton(() {}, Icon(Icons.search)),
        PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text(MetaText.selectNotes),
                value: MetaText.selectNotes,
              ),
              PopupMenuItem(
                child: Text(MetaText.addToHomeScreen),
                value: MetaText.addToHomeScreen,
              ),
              PopupMenuItem(
                child: Text(MetaText.sortBy),
                value: MetaText.sortBy,
              ),
              PopupMenuItem(
                child: Text(MetaText.viewOptions),
                value: MetaText.viewOptions,
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