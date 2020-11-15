import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/plain_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChoosePasscode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlainScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(flex: 1,),
          SvgPicture.asset('assets/logo.svg', color: Colors.grey,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(MetaText.pleaseChooseAPasscode),
          ),
          Spacer(flex: 1,),
        ],
      ),

    );
  }
}