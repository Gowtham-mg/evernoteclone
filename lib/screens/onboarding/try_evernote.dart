import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/plain_screen.dart';
import 'package:evernote/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TryEvernote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return PlainScreen(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CloseButton(
              color: Colors.grey,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Spacer(
              flex: 1,
            ),
            Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/giftbox.svg',
                  height: 80,
                  width: 80,
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                MetaText.tryEvernote,
                style: Theme.of(context).primaryTextTheme.headline1,
              ),
            ),
            FeatureItems(
              feature: MetaText.syncAcrossAllDevices,
            ),
            FeatureItems(
              feature: MetaText.get10GbPerMonth,
            ),
            FeatureItems(
              feature: MetaText.accessYourNotebooksOffline,
            ),
            Row(
              children: [
                Icon(
                  Icons.check,
                  color: Theme.of(context).accentColor,
                ),
                Text(
                  '  ${MetaText.tryit}',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(' ${MetaText.freeFor7Days}',
                    style: Theme.of(context).textTheme.caption),
                Text(
                  ' ${MetaText.cancelAnyTime}',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
            Spacer(
              flex: 2,
            ),
            GreenButton(
              width: _width * 0.9,
              text: MetaText.startFreeTrial,
              onPressed: () {},
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
