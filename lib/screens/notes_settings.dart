import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/app_bar_title_with_back_button.dart';
import 'package:flutter/material.dart';

class NotesSettings extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final int slideValue=90;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return ScaffoldWithBackButton(
      title: MetaText.notes,
      child: Scrollbar(
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding:
              EdgeInsets.symmetric(horizontal: _width * 0.04, vertical: 15),
          children: [
            Text(MetaText.addInfo),
            CheckboxListTile(
              title: Text(MetaText.addLocationToNewNotes),
              subtitle: Text(MetaText.addLocationToNewNotesDescription),
              isThreeLine: true,
              value: null,
              onChanged: (bool value) {},
            ),
            CheckboxListTile(
              title: Text(MetaText.autoTitleUsingLocation),
              subtitle: Text(MetaText.autoTitleUsingLocationDescription),
              isThreeLine: true,
              value: null,
              onChanged: (bool value) {},
            ),
            CheckboxListTile(
              title: Text(MetaText.autoTitleUsingCalendar),
              subtitle: Text(MetaText.autoTitleUsingCalendarDescription),
              isThreeLine: true,
              value: null,
              onChanged: (bool value) {},
            ),
            Text(MetaText.richLinks),
            CheckboxListTile(
              title: Text(MetaText.enableRichLinks),
              subtitle: Text(MetaText.enableRichLinksDescription),
              isThreeLine: true,
              value: null,
              onChanged: (bool value) {},
            ),
            ListTile(
              title: Text(MetaText.clearCache),
              subtitle: Text(MetaText.clearCacheLinksDescription),
              isThreeLine: true,
            ),
            Text(MetaText.editor),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${MetaText.scaleNotesBodySize} $slideValue%'),
                Slider(
                  value: null,
                  divisions: 1,
                  onChanged: (int value) {},
                  min: 50,
                  max: 200,
                )
              ],
            ),
            CheckboxListTile(
              title: Text(MetaText.autoLinkPhoneNumbers),
              subtitle: Text(MetaText.autoLinkPhoneNumbersDescription),
              isThreeLine: true,
              value: null,
              onChanged: (bool value) {},
            ),
          ],
        ),
      ),
    );
  }
}
