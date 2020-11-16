import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/app_bar_title_with_back_button.dart';
import 'package:evernote/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Settings extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackButton(
        title: MetaText.settings,
        child: Scrollbar(
            controller: _controller,
            child: ListView(
              controller: _controller,
              children: [
                //TODO: get email
                Text('abc@gmail.com'),
                Row(
                  children: [
                    Column(
                      children: [
                        SubscriptionCheckCircleAvatar(
                          outerColor: Colors.white,
                          innerColor: Colors.green,
                          istrue: true,
                        ),
                        Text(MetaText.basic)
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                    ),
                    SubscriptionCheckCircleAvatar(
                      outerColor: Colors.white,
                      innerColor: Colors.green,
                      istrue: false,
                    ),
                    Text(MetaText.premium)
                  ],
                ),
                Text(MetaText.exploreLevelsOfEvernote),
                Text(MetaText.settings.toUpperCase()),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(MetaText.accountInfo),
                  trailing: BorderedButton(
                      child: Text(MetaText.upgrade.toUpperCase()),
                      onPressed: () {}),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text(MetaText.notifications),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text(MetaText.camera),
                  onTap: () {},
                ),
                ListTile(
                  leading: SvgPicture.asset('assets/note2.svg'),
                  title: Text(MetaText.notebooks),
                  onTap: () {},
                ),
                ListTile(
                  leading: SvgPicture.asset('assets/note1.svg'),
                  title: Text(MetaText.notes),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.group_work_outlined),
                  title: Text(MetaText.workChat),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.cast_connected),
                  title: Text(MetaText.tutorials),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.loop),
                  title: Text(MetaText.syncNotes),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.connect_without_contact),
                  title: Text(MetaText.context),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.search),
                  title: Text(MetaText.searchAndStorage),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text(MetaText.connectedAccounts),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings_applications),
                  title: Text(MetaText.support),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.web),
                  title: Text(MetaText.legal),
                  onTap: () {},
                ),
              ],
            )));
  }
}

class SubscriptionCheckCircleAvatar extends StatelessWidget {
  const SubscriptionCheckCircleAvatar({
    Key key,
    this.istrue,
    this.outerColor,
    this.innerColor,
  }) : super(key: key);

  final bool istrue;
  final Color outerColor;
  final Color innerColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: innerColor,
      child: CircleAvatar(
        radius: 14,
        backgroundColor: outerColor,
        child: CircleAvatar(
          radius: 12,
          backgroundColor: innerColor,
          child: istrue ? Icon(Icons.check) : Offstage(),
        ),
      ),
    );
  }
}
