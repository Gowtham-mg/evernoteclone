import 'package:evernote/models/notebook.dart';
import 'package:evernote/routes/routes.dart';
import 'package:evernote/widgets/find_x_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/scaffold_with_appbar.dart';

class AllNotebooks extends StatelessWidget {
  final ScrollController _notebookScrollController = ScrollController();
  final TextEditingController _newNotebookController = TextEditingController();

  final recentNotebooks = List.generate(
      3, (index) => Notebook.named(name: 'jdsajdjaks', count: index));
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return ScaffoldWithAppBar(
      child: Scrollbar(
          controller: _notebookScrollController,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: 60,
            ),
            controller: _notebookScrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FindXButton(
                  text: MetaText.findANotebook,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.searchNotebooks);
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: _width * 0.04,
                  ),
                  child: Text(
                    MetaText.recentNotebook.split(' ')[0].toUpperCase(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                ...recentNotebooks
                    .map((notebook) => notebookItems(
                        context: context, width: _width, notebook: notebook))
                    .toList(),
                Padding(
                  padding: EdgeInsets.only(
                      left: _width * 0.04, right: _width * 0.04, top: 20),
                  child: Text(
                    MetaText.all,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                ListView.builder(
                  itemCount: 10,
                  controller: _notebookScrollController,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return notebookItems(
                        context: context,
                        width: _width,
                        notebook:
                            Notebook.named(name: 'jdsajdjaks', count: index));
                  },
                )
              ],
            ),
          )),
      title: MetaText.notebooks,
      actions: [
        actionButton(() {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(MetaText.newNotebook),
                        TextField(
                          controller: _newNotebookController,
                          decoration: InputDecoration(
                            hintText: 'Name',
                          ),
                        )
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: Text(MetaText.cancel,
                            style: Theme.of(context).primaryTextTheme.caption),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Text(MetaText.ok,
                            style: Theme.of(context).primaryTextTheme.caption),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ));
        },
            SvgPicture.asset(
              'assets/notebook-add.svg',
              height: Theme.of(context).primaryIconTheme.size,
              width: Theme.of(context).primaryIconTheme.size,
            )),
        actionButton(() {
          Navigator.pushNamed(context, Routes.searchNotebooks);
        }, Icon(Icons.search)),
        PopupMenuButton(
          icon: Icon(Icons.more_vert),
          onSelected: (String option) {
            switch (option) {
              case MetaText.sort:
                showSortOptions(context);
            }
          },
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
        )
      ],
    );
  }

  Container notebookItems(
      {@required double width,
      @required Notebook notebook,
      @required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
        // color:
        border: Border(
            bottom:
                BorderSide(color: Theme.of(context).dividerColor, width: 0.5)),
      ),
      padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: 10),
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notebook.name,
                    style: Theme.of(context).textTheme.headline5),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                      "${notebook.count} ${notebook.count <= 1 ? 'Note' : 'Notes'}",
                      style: Theme.of(context).textTheme.headline6),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_vert,
                color: Theme.of(context).appBarTheme.iconTheme.color),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.1),
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(MetaText.notebookOptions),
                            TextButton(
                              child: Text(MetaText.share),
                              onPressed: () {},
                            ),
                            TextButton(
                              child: Text(MetaText.makeAvailableOffline),
                              onPressed: () {},
                            ),
                            TextButton(
                              child: Text(MetaText.renameNotebook),
                              onPressed: () {},
                            ),
                            TextButton(
                              child: Text(MetaText.moveToNewStack),
                              onPressed: () {},
                            ),
                            TextButton(
                              child: Text(MetaText.addToShortcuts),
                              onPressed: () {},
                            ),
                            TextButton(
                              child: Text(MetaText.delete),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
          )
        ],
      ),
    );
  }

  showSortOptions(BuildContext context) async {
    double _width = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: _width * 0.85,
            margin: EdgeInsets.symmetric(horizontal: _width * 0.075),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Text(MetaText.sortNotebooksBy),
                CustomRadioTile(
                  title: MetaText.title,
                  onChanged: (bool val) {},
                ),
                CustomRadioTile(
                  title: MetaText.noteCount,
                  onChanged: (bool val) {},
                ),
                CustomRadioTile(
                  title: MetaText.owner,
                  onChanged: (bool val) {},
                )
              ],
            ),
          );
        });
  }

  IconButton actionButton(Function onPressed, Widget icon) => IconButton(
        icon: icon,
        onPressed: onPressed,
      );
}

class CustomRadioTile extends StatelessWidget {
  const CustomRadioTile({
    Key key,
    this.title,
    this.onChanged,
  }) : super(key: key);
  final String title;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: false,
          groupValue: false,
          onChanged: onChanged,
        ),
        Text(title)
      ],
    );
  }
}
