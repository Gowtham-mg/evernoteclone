import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/app_bar_title_with_back_button.dart';
import 'package:flutter/material.dart';

class AccountInfo extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackButton(
      title: MetaText.accountInfo,
      child: Scrollbar(
          controller: _controller,
          child: ListView(
            controller: _controller,
            children: [
              //TODO: get email
              Text('abc@gmail.com'),
              ListTile(
                title: Text(MetaText.currentMonthlyUsage),
                //TODO: display limit
                // subtitle: Text(),
                isThreeLine: true,
              ),
              ListTile(
                title: Text(MetaText.upgrade),
                subtitle: Text(MetaText.upgradeDescription),
                isThreeLine: true,
              ),
              ListTile(
                title: Text(MetaText.devices),
                subtitle: Text(MetaText.devicesDescription),
                isThreeLine: true,
              ),
              ListTile(
                title: Text(MetaText.evernoteEmail),
                //TODO: evernote email
                // subtitle: Text(MetaText.upgradeDescription),
                isThreeLine: true,
              ),
              ListTile(
                title: Text(MetaText.setupPasscodeLock),
                subtitle: Text(MetaText.setupPasscodeLockDescription),
                isThreeLine: true,
              ),
              ListTile(
                title: Text(MetaText.inviteFriendsGetPremium),
                subtitle: Text(MetaText.inviteFriendsGetPremiumDescription),
                isThreeLine: true,
              ),
              ListTile(
                title: Text(MetaText.country),
                //TODO: get country
                // subtitle: Text(MetaText.inviteFriendsGetPremiumDescription),
                isThreeLine: true,
                trailing: Transform.rotate(
                  angle: 40,
                  child: IconButton(
                    onPressed: (){
                      //TODO:show countries
                    },
                    icon: Icon(Icons.arrow_right)),
                ),
              ),
              TextButton(
                child: Text(MetaText.signOut),
                onPressed: (){
                  
                },
              )
            ],
          )),
    );
  }
}
