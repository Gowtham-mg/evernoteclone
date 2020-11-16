import 'package:evernote/hive_helper.dart';
import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ScaffoldWithAppBar extends StatelessWidget {
  final Widget child;
  final String title;
  final List<Widget> actions;

  ScaffoldWithAppBar(
      {Key key, @required this.child, @required this.title, this.actions})
      : super(key: key);

  final ScrollController _scrollBarController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.color,
          title: Text(
            title,
            style: Theme.of(context).appBarTheme.textTheme.headline6,
          ),
          actions: actions,
        ),
        body: child,
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () {
                  // TODO: Open a note
                },
                color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        bottomLeft: Radius.circular(24))),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add,
                      color: Theme.of(context).primaryIconTheme.color,
                      size: Theme.of(context).primaryIconTheme.size,
                    ),
                    Text(
                      MetaText.newNote,
                      style: Theme.of(context).textTheme.button,
                    ),
                  ],
                ),
              ),
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(24),
                          bottomRight: Radius.circular(24))),
                  color: Colors.green.shade900,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  minWidth: 0,
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierColor: Colors.black87,
                        useSafeArea: true,
                        builder: (BuildContext context) {
                          return CreateMore(width: _width);
                        });
                  },
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    color: Theme.of(context).primaryIconTheme.color,
                    size: Theme.of(context).primaryIconTheme.size,
                  ))
            ],
          ),
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
                        //TODO: get account details
                        CircleAvatar(
                          radius: 15,
                          child: Text('G'),
                          backgroundColor: Colors.red,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('gowthamgandhi123'),
                                Icon(Icons.keyboard_arrow_up)
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
                                activeColor: Theme.of(context).accentColor,
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

class CreateMore extends StatelessWidget {
  const CreateMore({
    Key key,
    @required double width,
  })  : _width = width,
        super(key: key);

  final double _width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width * 0.6,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(13))),
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(
        left: _width * 0.15,
        right: _width * 0.15,
        bottom: 20,
      ),
      child: Column(
        children: [
          optionItems(context, MetaText.addReminder, iconData: Icons.alarm),
          optionItems(context, MetaText.recordAudio,
              iconData: Icons.multitrack_audio),
          optionItems(context, MetaText.addAttachment,
              iconData: Icons.attach_file),
          optionItems(context, MetaText.startSketching,
              icon: SvgPicture.asset('assets/scribble.svg')),
          optionItems(context, MetaText.takePhoto,
              iconData: Icons.camera_enhance),
          optionItems(context, MetaText.blankNote, iconData: Icons.note_add),
        ],
      ),
    );
  }

  MaterialButton optionItems(BuildContext context, String option,
      {IconData iconData, SvgPicture icon}) {
    return MaterialButton(
      onPressed: () {},
      padding: const EdgeInsets.only(left: 5, right: 10, top: 7, bottom: 7),
      shape: Border(
          top: BorderSide.none,
          left: BorderSide.none,
          right: BorderSide.none,
          bottom:
              BorderSide(color: Theme.of(context).dividerColor, width: 0.8)),
      child: Row(
        children: [
          iconData == null ? icon : Icon(iconData),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(option),
          )
        ],
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
