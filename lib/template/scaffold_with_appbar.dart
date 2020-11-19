import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/widgets/drawer/common.dart';
import 'package:flutter/material.dart';

class ScaffoldWithAppBar extends StatelessWidget {
  final Widget child;
  final String title;
  final List<Widget> actions;

  ScaffoldWithAppBar(
      {Key key, @required this.child, @required this.title, this.actions})
      : super(key: key);

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
                minWidth: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
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
                    color: Colors.white,
                    size: Theme.of(context).primaryIconTheme.size,
                  ))
            ],
          ),
        ),
        drawer: CustomDrawer(),
      ),
    );
  }
}
