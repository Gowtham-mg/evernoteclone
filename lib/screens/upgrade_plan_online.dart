import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/widgets/common.dart';
import 'package:flutter/material.dart';

class UpgradePlanOnline extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scrollbar(
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
                  children: [Text(MetaText.upgradeTo), Text(MetaText.premium)],
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
                featureItems(MetaText.unlimitedDevices, Icons.computer),
                featureItems('10 GB ${MetaText.monthlyUploads.toLowerCase()}',
                    Icons.cloud_upload),
                featureItems('200 MB ${MetaText.perNote}', Icons.note),
                Text(MetaText.premiumAlsoIncludes),
                featureItems(MetaText.accessNotebooksOffline, Icons.check),
                featureItems(MetaText.searchInDocsAndAttachments, Icons.check),
                featureItems(MetaText.annotatePdfs, Icons.check),
                featureItems(MetaText.liveChatSupport, Icons.check),
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
                  children: [Text(MetaText.upgradeTo), Text(MetaText.premium)],
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
                featureItems(MetaText.basicDevicesLimit, Icons.computer),
                featureItems('60 MB ${MetaText.monthlyUploads.toLowerCase()}',
                    Icons.cloud_upload),
                featureItems('25 MB ${MetaText.perNote}', Icons.note),
                Text(MetaText.premiumAlsoIncludes),
                featureItems(MetaText.accessNotebooksOffline, Icons.close),
                featureItems(MetaText.searchInDocsAndAttachments, Icons.close),
                featureItems(MetaText.annotatePdfs, Icons.close),
                featureItems(MetaText.liveChatSupport, Icons.close),
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
    );
  }

  Row featureItems(String feature, IconData iconData) {
    return Row(
      children: [
        Icon(iconData),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(feature),
        )
      ],
    );
  }
}
