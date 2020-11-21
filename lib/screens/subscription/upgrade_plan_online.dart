import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/plain_screen.dart';
import 'package:evernote/widgets/common.dart';
import 'package:flutter/material.dart';

class UpgradePlanOnline extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return PlainScreen(
      color: Colors.white,
      child: Scrollbar(
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding: EdgeInsets.symmetric(vertical: 10),
          children: [
            // CustomPaint(
            //   painter: UpgradePlanCustomPainterPremium(),
            // child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: _width * 0.1),
                  child: Text(
                    MetaText.readyToDoMore,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                CloseButton(
                  color: Colors.grey.shade800,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            // ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: _width * 0.1, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MetaText.upgradeTo.toUpperCase(),
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 17),
                      ),
                      Text(
                        MetaText.premium,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  )),
                  Icon(
                    Icons.cloud_upload,
                    color: Colors.green,
                    size: 80,
                  ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      MetaText.premiumAlsoIncludes,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  FeatureItems(feature: MetaText.accessNotebooksOffline),
                  FeatureItems(feature: MetaText.searchInDocsAndAttachments),
                  FeatureItems(feature: MetaText.annotatePdfs),
                  FeatureItems(feature: MetaText.liveChatSupport),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: GreenButton(
                      width: _width * 0.8,
                      text: MetaText.goPremium,
                      onPressed: () {},
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(MetaText.comparePlans,
                            style: Theme.of(context).textTheme.subtitle2),
                      )),
                  Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey.shade800,
                      ))
                ],
              ),
            ),
            // CustomPaint(
            //   painter: UpgradePlanCustomPainterBasic(),
            // child:
            // ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: _width * 0.1, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      MetaText.currentPlan.toUpperCase(),
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 7),
                    child: Text(
                      MetaText.basic,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: BorderedButton(
                      width: _width * 0.8,
                      color: Colors.grey.shade600,
                      onPressed: () {},
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            MetaText.selectBasic,
                            style: TextStyle(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
