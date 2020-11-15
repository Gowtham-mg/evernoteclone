import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/app_bar_title_with_back_button.dart';
import 'package:evernote/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchAndStorage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackButton(
      title: MetaText.searchAndStorage,
      child: Column(
        children: [
          TextButton(
            child: Text(MetaText.clearLocalSearchHistory),
            onPressed: (){},
          ),
          TextButton(
            child: Column(
              children: [
                Text(MetaText.clearCache),
                Text(MetaText.clearCacheDescription),
              ],
            ),
            onPressed: (){

            },
          ),
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/note-search.svg'),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(MetaText.searchAttachments),
                    //TODO: check is premium user
                    Text(MetaText.searchAttachmentsDescription),
                  ],
                ),
              ),
              BorderedButton(
                child: Text(MetaText.upgradeAccount.split(' ')[0].toUpperCase()),
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );
  }
}