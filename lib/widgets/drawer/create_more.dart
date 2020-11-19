import 'package:evernote/meta/meta_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateMore extends StatelessWidget {
  const CreateMore({
    Key key,
    @required double width,
  })  : _width = width,
        super(key: key);

  final double _width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width * 0.6,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(13))),
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(
        left: _width * 0.15,
        right: _width * 0.15,
        bottom: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          optionItems(context, MetaText.addReminder, iconData: Icons.alarm),
          optionItems(context, MetaText.recordAudio,
              iconData: Icons.multitrack_audio),
          optionItems(context, MetaText.addAttachment,
              iconData: Icons.attach_file),
          optionItems(context, MetaText.startSketching,
              icon: SvgPicture.asset(
                'assets/scribble.svg',
                height: Theme.of(context).primaryIconTheme.size,
                width: Theme.of(context).primaryIconTheme.size,
              )),
          optionItems(context, MetaText.takePhoto,
              iconData: Icons.camera_enhance),
          optionItems(context, MetaText.blankNote, iconData: Icons.note_add),
        ],
      ),
    );
  }

  MaterialButton optionItems(BuildContext context, String option,
      {IconData iconData, SvgPicture icon}) {
    return MaterialButton(
      onPressed: () {},
      padding: const EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
      shape: Border(
          top: BorderSide.none,
          left: BorderSide.none,
          right: BorderSide.none,
          bottom:
              BorderSide(color: Theme.of(context).dividerColor, width: 0.8)),
      child: Row(
        children: [
          iconData == null ? icon : Icon(iconData),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(option),
          )
        ],
      ),
    );
  }
}