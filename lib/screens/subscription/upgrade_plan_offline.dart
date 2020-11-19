import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpgradePlanOffline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    TabSelectedCubit tabSelectedCubit = context.watch<TabSelectedCubit>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.color,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).accentIconTheme.color,
              size: Theme.of(context).accentIconTheme.size,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: SvgPicture.asset('assets/logo.svg'),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Theme.of(context).textTheme.bodyText1.color,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3,
            onTap: (int _index) {
              tabSelectedCubit.updateVal(_index);
            },
            tabs: [
              Tab(
                child: plan(MetaText.basic, context),
              ),
              Tab(
                child: plan(MetaText.premium, context),
              )
            ],
          ),
        ),
        body: Builder(builder: (BuildContext context) {
          int _index = tabSelectedCubit.state;
          return ListView(
            padding: EdgeInsets.symmetric(
              horizontal: _width * 0.04,
            ),
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).dividerColor, width: 1)),
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.symmetric(
                    horizontal: _width * 0.04, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _index == 0
                              ? MetaText.basicDevicesLimit
                              : MetaText.unlimitedDevices,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontSize: 20),
                        ),
                        Icon(Icons.computer)
                      ],
                    ),
                    Text(
                        _index == 0
                            ? MetaText.syncNotesBasic
                            : MetaText.syncNotesPremium,
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontSize: 16))
                  ],
                ),
              ),
              planItems(
                  title: MetaText.syncAcrossDevices,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.black),
                  trailing: Text(
                    _index == 0
                        ? MetaText.basicDevicesLimit
                        : MetaText.unlimitedDevices.split(' ')[0],
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  context: context),
              planItems(
                  title: MetaText.monthlyUploads,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.black),
                  trailing: Text(
                    _index == 0 ? '60 MB' : '10 GB',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  context: context),
              planItems(
                  title: MetaText.accessNotebooksOffline,
                  trailing: _index == 0
                      ? Offstage()
                      : Icon(Icons.check, color: Colors.grey, size: 22),
                  context: context),
              planItems(
                  title: MetaText.forwardEmailsIntoEvernote,
                  trailing: _index == 0
                      ? Offstage()
                      : Icon(Icons.check, color: Colors.grey, size: 22),
                  context: context),
              planItems(
                  title: MetaText.searchInDocsAndAttachments,
                  trailing: _index == 0
                      ? Offstage()
                      : Icon(Icons.check, color: Colors.grey, size: 22),
                  context: context),
              planItems(
                  title: MetaText.presentNotes,
                  trailing: _index == 0
                      ? Offstage()
                      : Icon(Icons.check, color: Colors.grey, size: 22),
                  context: context),
              planItems(
                  title: MetaText.annotatePdfs,
                  trailing: _index == 0
                      ? Offstage()
                      : Icon(Icons.check, color: Colors.grey, size: 22),
                  context: context),
              planItems(
                  title: MetaText.scanAndDigitizeBusinessCards,
                  trailing: _index == 0
                      ? Offstage()
                      : Icon(Icons.check, color: Colors.grey, size: 22),
                  context: context),
              planItems(
                  title: MetaText.browseHistoryOfNotes,
                  trailing: _index == 0
                      ? Offstage()
                      : Icon(Icons.check, color: Colors.grey, size: 22),
                  context: context),
              planItems(
                  title: MetaText.discoverRelatedContent,
                  trailing: _index == 0
                      ? Offstage()
                      : Icon(Icons.check, color: Colors.grey, size: 22),
                  context: context),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: _index == 0
                      ? BorderedButton(
                          onPressed: () {},
                          width: _width * 0.92,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Column(
                              children: [
                                Text(
                                  MetaText.selectBasic,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .caption
                                      .copyWith(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  MetaText.free,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .caption
                                      .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        )
                      : GreenButton(
                          width: _width * 0.92,
                          text: MetaText.goPremium,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      content: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 15,
                                        ),
                                        child: Text(
                                          MetaText.youMustBeOnlineToUpgrade,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4
                                              .copyWith(fontSize: 18),
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 25),
                                      actions: [TextButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        child: Text(MetaText.gotit,
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 16
                                          ),
                                        ),
                                      )],
                                    ));
                          },
                        ))
            ],
          );
        }),
      ),
    );
  }

  Container planItems(
      {@required String title,
      @required Widget trailing,
      @required BuildContext context,
      TextStyle style}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 15),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide.none,
              left: BorderSide.none,
              right: BorderSide.none,
              bottom: BorderSide(
                  color: Theme.of(context).dividerColor.withOpacity(0.5),
                  width: 0.8))),
      child: Row(
        children: [
          Expanded(
              child: Text(
            title,
            style: style ??
                Theme.of(context).textTheme.headline4.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .headline4
                        .color
                        .withOpacity(0.7)),
          )),
          trailing
        ],
      ),
    );
  }

  Text plan(String title, BuildContext context) =>
      Text(title, style: Theme.of(context).textTheme.bodyText1);
}

class TabSelectedCubit extends Cubit<int> {
  TabSelectedCubit() : super(0);

  void updateVal(int index) => emit(index);
}
