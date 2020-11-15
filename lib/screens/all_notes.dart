import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/scaffold_with_appbar.dart';
import 'package:flutter/material.dart';

class AllNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppBar(
      child: Container(),
      title: MetaText.allNotes,
    );
  }
}