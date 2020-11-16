import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpgradePlanOffline extends StatelessWidget {
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
                    border: Border.all(
                        color: Theme.of(context).dividerColor, width: 1)),
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
                  title: MetaText.syncAcrossDevices,
                  trailing: Text(_index == 0
                      ? MetaText.basicDevicesLimit
                      : MetaText.unlimitedDevices.split(' ')[0]),
                  context: context),
              planItems(
                  title: MetaText.monthlyUploads,
                  trailing: Text(_index == 0 ? '60 MB' : '10 GB'),
                  context: context),
              planItems(
                  title: MetaText.accessNotebooksOffline,
                  trailing: _index == 0 ? Offstage() : Icon(Icons.check),
                  context: context),
              planItems(
                  title: MetaText.forwardEmailsIntoEvernote,
                  trailing: _index == 0 ? Offstage() : Icon(Icons.check),
                  context: context),
              planItems(
                  title: MetaText.searchInDocsAndAttachments,
                  trailing: _index == 0 ? Offstage() : Icon(Icons.check),
                  context: context),
              planItems(
                  title: MetaText.presentNotes,
                  trailing: _index == 0 ? Offstage() : Icon(Icons.check),
                  context: context),
              planItems(
                  title: MetaText.annotatePdfs,
                  trailing: _index == 0 ? Offstage() : Icon(Icons.check),
                  context: context),
              planItems(
                  title: MetaText.scanAndDigitizeBusinessCards,
                  trailing: _index == 0 ? Offstage() : Icon(Icons.check),
                  context: context),
              planItems(
                  title: MetaText.browseHistoryOfNotes,
                  trailing: _index == 0 ? Offstage() : Icon(Icons.check),
                  context: context),
              planItems(
                  title: MetaText.discoverRelatedContent,
                  trailing: _index == 0 ? Offstage() : Icon(Icons.check),
                  context: context),
              _index == 0
                  ? BorderedButton(
                      onPressed: () {},
                      width: _width * 0.92,
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
                  : GreenButton(
                      width: _width * 0.92,
                      text: MetaText.goPremium,
                      onPressed: () {},
                    )
            ],
          );
        }),
      ),
    );
  }

  Container planItems(
      {@required String title,
      @required Widget trailing,
      @required BuildContext context}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide.none,
              left: BorderSide.none,
              right: BorderSide.none,
              bottom: BorderSide(
                  color: Theme.of(context).dividerColor, width: 0.8))),
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
