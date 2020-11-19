import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/routes/routes.dart';
import 'package:evernote/template/plain_screen.dart';
import 'package:evernote/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return PlainScreen(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
        child: Column(
          children: [
            Spacer(
              flex: 3,
            ),
            SvgPicture.asset(
              'assets/logo.svg',
              height: min(_width * 0.3, _height * 0.25),
              width: _width * 0.35,
            ),
            Spacer(
              flex: 2,
            ),
            Text(
              MetaText.welcome,
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
            Spacer(
              flex: 2,
            ),
            Text(
              MetaText.letsTakeATour,
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
            Spacer(
              flex: 2,
            ),
            GreenButton(
                width: _width * 0.9,
                text: MetaText.greatLetsGo,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.onboarding);
                }),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.allNotes);
                  },
                  child: Text(
                    MetaText.noThanks,
                    style: TextStyle(color: Colors.green, fontSize: 14),
                  )),
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
