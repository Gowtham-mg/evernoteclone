import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/models/notebook.dart';
import 'package:evernote/routes/routes.dart';
import 'package:evernote/template/scaffold_with_appbar.dart';
import 'package:evernote/widgets/common.dart';
import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  final ScrollController _tagsScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return ScaffoldWithAppBar(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FindXButton(
              text: MetaText.findATag,
              onPressed: () {
                Navigator.pushNamed(context, Routes.findTag);
              }),
          Expanded(
            child: Scrollbar(
              controller: _tagsScrollController,
              child: ListView.builder(
                padding:
                    EdgeInsets.symmetric(horizontal: _width * 0.05, vertical: 10),
                itemCount: 10,
                controller: _tagsScrollController,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return notebookItems(
                      context: context,
                      width: _width,
                      notebook: Notebook.named(name: 'jdsajdjaks', count: index));
                },
              ),
            ),
          )
        ],
      ),
      title: MetaText.tags,
      actions: [
        actionButton(() {}, Icon(Icons.search)),
        PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (BuildContext context) {
            return [
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

  IconButton actionButton(Function onPressed, Widget icon) => IconButton(
        icon: icon,
        onPressed: onPressed,
      );

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(notebook.name, style: Theme.of(context).textTheme.headline5),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
                "${notebook.count} ${notebook.count <= 1 ? 'Note' : 'Notes'}",
                style: Theme.of(context).textTheme.headline6),
          ),
        ],
      ),
    );
  }
}
