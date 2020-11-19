import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/scaffold_with_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SharedWithMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return ScaffoldWithAppBar(
      title: MetaText.sharedWithMe,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: _width*0.1),
        child: Column(
          children: [
            Spacer(flex: 1),
            // SvgPicture.asset('assets/share-devices.svg',
            //   height: 150,
            //   width: 150,
            // ),
            Text(
              MetaText.nothingSharedYet,
              style: Theme.of(context).textTheme.headline5
            ),
            Text(
              MetaText.sharedWithMeDescription,
              style: Theme.of(context).textTheme.headline4.copyWith(
                height: 1.5,
                fontSize: 16
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
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
