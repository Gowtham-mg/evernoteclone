import 'package:evernote/hive_helper.dart';
import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ScaffoldWithAppBar extends StatelessWidget {
  final Widget child;
  final String title;

  ScaffoldWithAppBar({Key key, @required this.child, @required this.title})
      : super(key: key);

  final ScrollController _scrollBarController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(title),
        ),
        body: child,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          children: [
            FlatButton(
              onPressed: (){
                // TODO: Open a note
              },
              color: Colors.green.shade600,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      bottomLeft: Radius.circular(24))),
              child: Row(
                children: [
                  Icon(Icons.add),
                  Text(MetaText.newNote),
                ],
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      bottomLeft: Radius.circular(24))),
              onPressed: (){

              },
              child: Icon(Icons.arrow_upward_sharp))
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Scrollbar(
                isAlwaysShown: false,
                controller: _scrollBarController,
                child: ListView(
                  controller: _scrollBarController,
                  shrinkWrap: true,
                  padding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 7, top: 5),
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          child: Text('G'),
                          //TODO: get account details
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('gowthamgandhi123'),
                                Icon(Icons.arrow_upward_outlined)
                              ],
                            ),
                            Text('gowthamgandhi123@gmail.com')
                          ],
                        ),
                        //TODO: switch based on plan
                        Text(MetaText.basicPlan)
                      ],
                    ),
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
                        Navigator.pushNamed(context, Routes.allNotes);
                      },
                    ),
                    DrawerItems(
                      icon: Icons.people,
                      title: MetaText.sharedWithMe,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.allNotes);
                      },
                    ),
                    DrawerItems(
                      icon: Icons.tag,
                      title: MetaText.tags,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.allNotes);
                      },
                    ),
                    DrawerItems(
                      icon: Icons.photo_library,
                      title: MetaText.collectPhotos,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.allNotes);
                      },
                    ),
                    DrawerItems(
                      icon: Icons.chat,
                      title: MetaText.workChat,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.allNotes);
                      },
                    ),
                    DrawerItems(
                      icon: Icons.delete,
                      title: MetaText.trash,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.allNotes);
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
                                Hive.box(HiveHelper.themeMode).listenable(),
                            builder: (BuildContext context, Box box, widget) {
                              bool val = box.get(HiveHelper.darkMode) ?? false;
                              return Switch(
                                activeColor: Colors.green.shade600,
                                value: val,
                                onChanged: (bool value) {
                                  box.put(HiveHelper.darkMode, !val);
                                },
                              );
                            })
                      ],
                    ),
                    DrawerItems(
                      icon: Icons.settings,
                      title: MetaText.settings,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.allNotes);
                      },
                    ),
                    DrawerItems(
                      icon: Icons.settings_applications,
                      title: MetaText.exploreEvernote,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.allNotes);
                      },
                    ),
                  ],
                ),
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
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  const DrawerItems({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.onPressed,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(title),
          )
        ],
      ),
    );
  }
}
