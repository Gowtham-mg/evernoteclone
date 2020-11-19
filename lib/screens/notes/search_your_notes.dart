import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/plain_screen.dart';
import 'package:flutter/material.dart';

class SearchYourNotes extends StatelessWidget {
  final TextEditingController _searchNotesController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _searchFocusNode = FocusNode();
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
                    controller: _searchNotesController,
                    focusNode: _searchFocusNode,
                    decoration: InputDecoration(
                      hintText: MetaText.searchYourNotes,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: FlatButton(
            onPressed: (){},
            minWidth: _width - 40,
            color: Theme.of(context).appBarTheme.color,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(MetaText.refineYourSearch, 
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).appBarTheme.color,
            child: Scrollbar(
              controller: _scrollController,
              child: ListView.builder(
                itemCount: 20,
                controller: _scrollController,
                padding: EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (BuildContext context, int index) {
                  return MaterialButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Icon(
                          Icons.note_outlined,
                          color: Theme.of(context).accentIconTheme.color,
                          size: Theme.of(context).accentIconTheme.size,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Text(
                            'Note name',
                            style: Theme.of(context).textTheme.headline4,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
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
