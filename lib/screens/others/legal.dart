import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/routes/routes.dart';
import 'package:evernote/template/app_bar_title_with_back_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Legal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackButton(
      title: MetaText.legal,
      child: Column(
        children: [
          openButtonUrl(
              MetaText.privacyPolicy, 'https://evernote.com/privacy/'),
          openButtonUrl(MetaText.termsOfService,
              'https://evernote.com/legal/terms-of-service/'),
          TextButton(
            onPressed: (){
              Navigator.pushNamed(context, Routes.attributions);
            },
            child: Text(MetaText.attributions)),
        ],
      ),
    );
  }

  TextButton openButtonUrl(String text, String url) {
    return TextButton(
      onPressed: () {
        launch(
          url,
          enableJavaScript: true,
          forceWebView: true,
        );
      },
      child: Text(text),
    );
  }
}
