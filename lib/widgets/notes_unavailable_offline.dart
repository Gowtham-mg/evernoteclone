import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/routes/routes.dart';
import 'package:flutter/material.dart';

class NotesUnavailableOffline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _width*0.1,),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(MetaText.notesUnavailableOffline),
          Text(MetaText.notesUnavailableOfflineDescription),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text(MetaText.chooseLater),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text(MetaText.learnMore),
                onPressed: (){
                  Navigator.pushNamed(context, Routes.susbcription);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}