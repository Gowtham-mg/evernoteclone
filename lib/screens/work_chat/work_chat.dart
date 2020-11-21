import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/routes/routes.dart';
import 'package:evernote/template/scaffold_with_appbar.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Workchat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppBar(
      title: MetaText.workChat,
      actions: [
        IconButton(
          icon: Icon(Icons.people),
          onPressed: () {
            Navigator.pushNamed(context, Routes.sharedWithMe);
          },
        ),
        PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text(MetaText.addToHomeScreen),
                  value: MetaText.addToHomeScreen,
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
      child: WorkChatEmpty(),
    );
  }
}

class WorkChatEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _width * 0.05, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MaterialButton(
            onPressed: () async {
              await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: _width * 0.15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(MetaText.shareContactTitle),
                          Text(MetaText.shareContactDescription),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                child: Text(MetaText.deny),
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.newChat);
                                },
                              ),
                              TextButton(
                                child: Text(MetaText.request),
                                onPressed: () async {
                                  PermissionStatus request =
                                      await Permission.contacts.request();
                                  if (request.isGranted) {}
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  });
            },
            minWidth: 0,
            shape: CircleBorder(),
            padding: EdgeInsets.all(5),
            color: Colors.blue.shade300,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).dividerColor, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/office-pic.jpg',
                  width: _width * 0.9,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: _width * 0.07, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          MetaText.startChatting,
                          style: Theme.of(context).primaryTextTheme.headline6,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Text('${MetaText.tap} ',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue.shade300,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 17,
                                ),
                              ),
                              Text(' ${MetaText.tapTostartChat}',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1),
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
