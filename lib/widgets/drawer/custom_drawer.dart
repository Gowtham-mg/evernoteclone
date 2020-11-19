import 'package:evernote/hive_helper.dart';
import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/routes/routes.dart';
import 'package:evernote/widgets/drawer/drawer_items.dart';
import 'package:evernote/widgets/drawer/drawer_user_info.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomDrawer extends StatelessWidget {
  final ScrollController _scrollBarController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scrollbar(
        isAlwaysShown: false,
        controller: _scrollBarController,
        child: ListView(
          controller: _scrollBarController,
          shrinkWrap: true,
          padding:
              EdgeInsets.only(left: 10, right: 10, bottom: 7, top: 5),
          children: [
            UserInfo(),
            DrawerItems(
              icon: Icons.note,
              title: MetaText.allNotes,
              onPressed: () {
                Navigator.pushNamed(context, Routes.allNotes);
              },
            ),
            DrawerItems(
              icon: Icons.book,
              title: MetaText.notebooks,
              onPressed: () {
                Navigator.pushNamed(context, Routes.notebooks);
              },
            ),
            DrawerItems(
              icon: Icons.people,
              title: MetaText.sharedWithMe,
              onPressed: () {
                Navigator.pushNamed(context, Routes.sharedWithMe);
              },
            ),
            DrawerItems(
              icon: Icons.tag,
              title: MetaText.tags,
              onPressed: () {
                Navigator.pushNamed(context, Routes.tags);
              },
            ),
            DrawerItems(
              icon: Icons.photo_library,
              title: MetaText.collectPhotos,
              onPressed: () {
                Navigator.pushNamed(context, Routes.collectPhotos);
              },
            ),
            DrawerItems(
              icon: Icons.chat,
              title: MetaText.workChat,
              onPressed: () {
                Navigator.pushNamed(context, Routes.workChat);
              },
            ),
            DrawerItems(
              icon: Icons.delete,
              title: MetaText.trash,
              onPressed: () {
                Navigator.pushNamed(context, Routes.trash);
              },
            ),
            Row(
              children: [
                Icon(Icons.brightness_3),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(MetaText.darkTheme),
                  ),
                ),
                ValueListenableBuilder(
                    valueListenable:
                        Hive.box(HiveBoxHelper.themeMode).listenable(),
                    builder: (BuildContext context, Box box, widget) {
                      bool val =
                          box.get(HiveKeyHelper.darkMode) ?? false;
                      return Switch(
                        activeColor: Theme.of(context).accentColor,
                        value: val,
                        onChanged: (bool value) {
                          box.put(HiveKeyHelper.darkMode, !val);
                        },
                      );
                    })
              ],
            ),
            DrawerItems(
              icon: Icons.settings,
              title: MetaText.settings,
              onPressed: () {
                Navigator.pushNamed(context, Routes.settings);
              },
            ),
            DrawerItems(
              icon: Icons.settings_applications,
              title: MetaText.exploreEvernote,
              onPressed: () {
                Navigator.pushNamed(context, Routes.settings);
              },
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide.none,
                      left: BorderSide.none,
                      right: BorderSide.none)),
              padding:
                  EdgeInsets.only(left: 10, right: 10, bottom: 7, top: 5),
              child: Row(
                children: [
                  Icon(Icons.refresh),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(MetaText.lastSync),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}