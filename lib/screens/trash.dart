import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/scaffold_with_appbar.dart';
import 'package:flutter/material.dart';

class Trash extends StatelessWidget {
  final String date = 'Nov 2020';
  final String title = 'fdsfkzxcnbxcnvmnfcjksdAfhsdfdx c xzjnczXFvjksdcczxcC zxcszKDFksZDfc';
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppBar(
      title: MetaText.trash,
      child: ListView.builder(
        itemCount: 10, 
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Text(date),
              Text(title),
            ],
          );
        },
      ),
    );
  }
}