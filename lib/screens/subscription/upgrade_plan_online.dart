import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/widgets/common.dart';
import 'package:flutter/material.dart';

class UpgradePlanOnline extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scrollbar(
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          children: [
            ClipPath(
              clipper: UpgradePlanCustomClipperBasic(),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * 0.1),
                    child: Text(MetaText.readyToDoMore),
                  ),
                  CloseButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: _width * 0.1, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text(MetaText.upgradeTo),
                      Text(MetaText.premium)
                    ],
                  )),
                  Icon(Icons.cloud_upload),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: _width * 0.1, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FeatureItems(
                      feature: MetaText.unlimitedDevices,
                      iconData: Icons.computer),
                  FeatureItems(
                      feature: '10 GB ${MetaText.monthlyUploads.toLowerCase()}',
                      iconData: Icons.cloud_upload),
                  FeatureItems(
                      feature: '200 MB ${MetaText.perNote}',
                      iconData: Icons.note),
                  Text(MetaText.premiumAlsoIncludes),
                  FeatureItems(feature: MetaText.accessNotebooksOffline),
                  FeatureItems(feature: MetaText.searchInDocsAndAttachments),
                  FeatureItems(feature: MetaText.annotatePdfs),
                  FeatureItems(feature: MetaText.liveChatSupport),
                  GreenButton(
                    width: _width * 0.8,
                    text: MetaText.goPremium,
                    onPressed: () {},
                  ),
                  Text(MetaText.comparePlans),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),
            ClipPath(
              clipper: UpgradePlanCustomClipperPremium(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * 0.1),
                child: Text(MetaText.basic),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: _width * 0.1, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text(MetaText.upgradeTo),
                      Text(MetaText.premium)
                    ],
                  )),
                  Icon(Icons.cloud_upload),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: _width * 0.1, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FeatureItems(
                      feature: MetaText.basicDevicesLimit,
                      iconData: Icons.computer),
                  FeatureItems(
                      feature: '60 MB ${MetaText.monthlyUploads.toLowerCase()}',
                      iconData: Icons.cloud_upload),
                  FeatureItems(
                      feature: '25 MB ${MetaText.perNote}',
                      iconData: Icons.note),
                  Text(MetaText.premiumAlsoIncludes),
                  FeatureItems(
                      feature: MetaText.accessNotebooksOffline,
                      iconData: Icons.close),
                  FeatureItems(
                      feature: MetaText.searchInDocsAndAttachments,
                      iconData: Icons.close),
                  FeatureItems(
                      feature: MetaText.annotatePdfs, iconData: Icons.close),
                  FeatureItems(
                      feature: MetaText.liveChatSupport, iconData: Icons.close),
                  BorderedButton(
                    width: _width * 0.8,
                    onPressed: () {},
                    child: Text(MetaText.selectBasic),
                  ),
                  Text(MetaText.comparePlans),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
