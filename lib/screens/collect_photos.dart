import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/plain_screen.dart';
import 'package:evernote/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CollectPhotos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return PlainScreen(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _width * 0.075),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: _width * 0.15,
                    ),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: SvgPicture.asset('assets/note1.svg'),
                  ),
                  Positioned(
                    bottom: 25,
                    right: 30,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      child: SvgPicture.asset('assets/note2.svg'),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    right: 30,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      transform: Matrix4.rotationX(30),
                      child: SvgPicture.asset('assets/note3.svg'),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Theme.of(context).accentColor,
                      child: Icon(Icons.check, color: Colors.white,),
                    ),
                  )
                ],
              ),
            ),
            Text(MetaText.collectPhotosTitle),
            Text(MetaText.collectPhotosDescription1),
            GreenButton(
              width: _width * 0.85,
              text: MetaText.allow,
              onPressed: () {},
            ),
            Text(
              MetaText.collectPhotosDescription2,
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
