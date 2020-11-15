import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/app_bar_title_with_back_button.dart';
import 'package:flutter/material.dart';

class Tutorials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackButton(
      title: MetaText.tutorials,
      child: Column(
        children: [
          CheckboxListTile(
            value: null,
            onChanged: (bool val){

            },
            title: Text(MetaText.turnOffEducationalTips),
          ),
          TextButton(
            child: Text(MetaText.evernoteTour),
            onPressed: (){},
          )
        ],
      ),
    );
  }
}