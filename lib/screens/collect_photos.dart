import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/plain_screen.dart';
import 'package:evernote/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CollectPhotos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return PlainScreen(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _width * 0.075),
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: _width * 0.15, top: _height * 0.1),
                  height: _height * 0.4,
                  alignment: Alignment.topLeft,
                  child: SvgPicture.asset(
                    'assets/note1.svg',
                    height: 80,
                    width: 80,
                    color: Theme.of(context).brightness == Brightness.light
                        ? null
                        : Colors.white,
                  ),
                ),
                Positioned(
                  left: (_width * 0.15) + 40,
                  top: (_height * 0.1) + 40,
                  child: SvgPicture.asset(
                    'assets/note2.svg',
                    height: 80,
                    width: 80,
                  ),
                ),
                Positioned(
                    left: (_width * 0.15) + 80,
                    top: (_height * 0.1) + 80,
                    child: SvgPicture.asset(
                      'assets/note3.svg',
                      height: 80,
                      width: 80,
                    )),
                Positioned(
                  left: (_width * 0.15) + 80 + 54,
                  top: (_height * 0.1) + 80,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: Theme.of(context).accentColor,
                    child: Icon(
                      Icons.check,
                      size: 26,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              MetaText.collectPhotosTitle,
              style:
                  Theme.of(context).textTheme.headline1.copyWith(height: 1.65),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                MetaText.collectPhotosDescription1,
                style:
                    Theme.of(context).textTheme.headline4.copyWith(height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
            GreenButton(
              width: _width * 0.85,
              text: MetaText.allow,
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                MetaText.collectPhotosDescription2,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(height: 1.75),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
