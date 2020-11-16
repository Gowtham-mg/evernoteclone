import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/plain_screen.dart';
import 'package:flutter/material.dart';

class SearchYourNotes extends StatelessWidget {
  final TextEditingController _searchNotesController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return PlainScreen(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _searchNotesController,
                  focusNode: _searchFocusNode,
                  decoration: InputDecoration(
                    hintText: MetaText.searchYourNotes,
                  ),
                ),
              )
            ],
          ),
          
        ],
      )
    );
  }
}