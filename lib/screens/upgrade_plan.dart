import 'package:evernote/meta/meta_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpgradePlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: SvgPicture.asset('assets/logo.svg'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                child: plan(MetaText.basic),
              ),
              Tab(
                child: plan(MetaText.premium),
              )
            ],
          ),
        ),
        body: Builder(builder: (BuildContext context) {
          final int _index = DefaultTabController.of(context).index;
          return ListView(
            padding: EdgeInsets.symmetric(
              horizontal: _width * 0.04,
            ),
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1)),
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(
                    horizontal: _width * 0.04, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _index == 0
                            ? Text(MetaText.basicDevicesLimit)
                            : Text(MetaText.unlimitedDevices),
                        Icon(Icons.computer)
                      ],
                    ),
                    _index == 0
                        ? Text(MetaText.syncNotesBasic)
                        : Text(MetaText.syncNotesPremium)
                  ],
                ),
              ),
              planItems(
                  MetaText.syncAcrossDevices,
                  Text(_index == 0
                      ? MetaText.basicDevicesLimit
                      : MetaText.unlimitedDevices.split(' ')[0])),
              planItems(MetaText.monthlyUploads,
                  Text(_index == 0 ? '60 MB' : '10 GB')),
              planItems(MetaText.accessNotebooksOffline,
                  _index == 0 ? Offstage() : Icon(Icons.check)),
              planItems(MetaText.forwardEmailsIntoEvernote,
                  _index == 0 ? Offstage() : Icon(Icons.check)),
              planItems(MetaText.searchInDocsAndAttachments,
                  _index == 0 ? Offstage() : Icon(Icons.check)),
              planItems(MetaText.presentNotes,
                  _index == 0 ? Offstage() : Icon(Icons.check)),
              planItems(MetaText.annotatePdfs,
                  _index == 0 ? Offstage() : Icon(Icons.check)),
              planItems(MetaText.scanAndDigitizeBusinessCards,
                  _index == 0 ? Offstage() : Icon(Icons.check)),
              planItems(MetaText.browseHistoryOfNotes,
                  _index == 0 ? Offstage() : Icon(Icons.check)),
              planItems(MetaText.discoverRelatedContent,
                  _index == 0 ? Offstage() : Icon(Icons.check)),
              _index == 0
                  ? MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          side: BorderSide(color: Colors.green.shade600)),
                      padding: EdgeInsets.symmetric(vertical: 5),
                      minWidth: _width * 0.92,
                      child: Column(
                        children: [
                          Text(
                            MetaText.selectBasic,
                            textAlign: TextAlign.center,
                          ),
                          Text(MetaText.free, textAlign: TextAlign.center)
                        ],
                      ),
                    )
                  : MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 9),
                      color: Colors.green.shade600,
                      minWidth: _width * 0.92,
                      child: Text(
                        MetaText.goPremium,
                        textAlign: TextAlign.center,
                      ),
                    )
            ],
          );
        }),
      ),
    );
  }

  Container planItems(String title, Widget trailing) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide.none,
              left: BorderSide.none,
              right: BorderSide.none,
              bottom: BorderSide(color: Colors.grey, width: 0.8))),
      child: Row(
        children: [Expanded(child: Text(title)), trailing],
      ),
    );
  }

  Column plan(String title) {
    return Column(
      children: [
        Text(title),
        Divider(
          thickness: 1.5,
          indent: 20,
          endIndent: 20,
        )
      ],
    );
  }
}
