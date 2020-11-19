import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/models/tags.dart';
import 'package:evernote/template/plain_screen.dart';
import 'package:flutter/material.dart';

class FindATag extends StatelessWidget {
  final TextEditingController _findATagController = TextEditingController();
  final ScrollController _findATagscrollController = ScrollController();
  final FocusNode _findTagFocusNode = FocusNode();

  final tagRepo =
      List.generate(3, (index) => Tag.named(name: 'jdsajdjaks', count: index));
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return PlainScreen(
        child: Column(
      children: [
        Container(
          color: Theme.of(context).appBarTheme.color,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).iconTheme.color,
                  )),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: _findATagController,
                    focusNode: _findTagFocusNode,
                    decoration: InputDecoration(hintText: MetaText.findATag),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Scrollbar(
              controller: _findATagscrollController,
              child: ListView.builder(
                itemCount: tagRepo.length,
                controller: _findATagscrollController,
                padding: EdgeInsets.symmetric(horizontal: _width * 0.04),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tagRepo[index].name,
                          style: Theme.of(context).textTheme.headline5),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                            "${tagRepo[index].count} ${tagRepo[index].count <= 1 ? 'Note' : 'Notes'}",
                            style: Theme.of(context).textTheme.headline6),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        )
      ],
    ));
  }
}
