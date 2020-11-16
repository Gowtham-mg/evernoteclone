import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/app_bar_title_with_back_button.dart';
import 'package:evernote/widgets/common.dart';
import 'package:flutter/material.dart';

class CameraSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return ScaffoldWithBackButton(
      title: MetaText.camera,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: _width * 0.04, vertical: 10),
        children: [
          CheckboxListTile(
            title: Text(MetaText.activateMultishot),
            subtitle: Text(MetaText.activateMultishotDescription),
            isThreeLine: true,
            value: null,
            onChanged: (bool value) {},
          ),
          CheckboxListTile(
            title: Text(MetaText.savePhotoToGallery),
            subtitle: Text(MetaText.savePhotoToGalleryDescription),
            isThreeLine: true,
            value: null,
            onChanged: (bool value) {},
          ),
          ListTile(
            title: Text(MetaText.moleskineNotebook),
            subtitle: Text(MetaText.moleskineNotebookDescription),
            isThreeLine: true,
          ),
          ListTile(
            title: Text(MetaText.postItNotes),
            subtitle: Text(MetaText.postItNotesDescription),
            isThreeLine: true,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(MetaText.businessCards),
                    Text(MetaText.businessCardsDescription),
                  ],
                ),
              ),
              BorderedButton(
                child:
                    Text(MetaText.upgradeAccount.split(' ')[0].toUpperCase()),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
