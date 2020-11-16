import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/app_bar_title_with_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContextSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackButton(
      title: MetaText.context,
      child: Column(
        children: [
          Spacer(flex: 2,),
          SvgPicture.asset('assets/context.svg'),
          Text(MetaText.upgradeForContext),
          Text(MetaText.upgradeForContextDescription),
          TextButton(
            child: Text('${MetaText.upgradeTo} ${MetaText.premium}'.toUpperCase()),
            onPressed: (){},
          ),
          Spacer(flex: 2,),
        ],
      ),
    );
  }
}