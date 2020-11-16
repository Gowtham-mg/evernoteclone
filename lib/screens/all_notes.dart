import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/scaffold_with_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';

class AllNotes extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return ScaffoldWithAppBar(
      title: MetaText.allNotes,
      actions: [
        actionButton(() {}, SvgPicture.asset('assets/flash.svg')),
        actionButton(() {}, Icon(Icons.search)),
        PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text(MetaText.selectNotes),
                value: MetaText.selectNotes,
              ),
              PopupMenuItem(
                child: Text(MetaText.addToHomeScreen),
                value: MetaText.addToHomeScreen,
              ),
              PopupMenuItem(
                child: Text(MetaText.sortBy),
                value: MetaText.sortBy,
              ),
              PopupMenuItem(
                child: Text(MetaText.viewOptions),
                value: MetaText.viewOptions,
              ),
              PopupMenuItem(
                child: Text(MetaText.syncNotes),
                value: MetaText.syncNotes,
              ),
              PopupMenuItem(
                child: Text(MetaText.settings),
                value: MetaText.settings,
              ),
            ];
          },
        ),
      ],
      child: Scrollbar(
        controller: _scrollController,
        isAlwaysShown: false,
        thickness: 5,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * 0.04),
          child: Column(
            children: [
              Flexible(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            height: 100,
                            width: _width * 0.92,
                            child: SercuredGif()),
                        Padding(
                          padding: EdgeInsets.only(
                              left: _width * 0.05,
                              right: _width * 0.05,
                              top: 2,
                              bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(MetaText.protectYourNotes),
                              Text(MetaText.protectYourNotesDescription),
                              Container(
                                width: _width * 0.82,
                                alignment: Alignment.bottomRight,
                                child: TextButton(
                                  child: Text(MetaText.setPasscode),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                          ),
                          bottom: BorderSide(
                            color: Colors.grey,
                          )),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('24/04/2021'),
                        Text('Title dsasdksdfvnxckcv dcsadf'),
                        Text('description cbzcbs hasdhasdbxzc dhiosadhjxcxbc zasdjsahdsnBczx csjdaidhaschzxc dhdhjhczxncnzdcsda sscichzxcjsddbc zchiasdchshcjsadczs'),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconButton actionButton(Function onPressed, Widget icon) => IconButton(
        icon: icon,
        onPressed: onPressed,
      );
}

class SercuredGif extends StatefulWidget {
  @override
  _SercuredGifState createState() => _SercuredGifState();
}

class _SercuredGifState extends State<SercuredGif>
    with SingleTickerProviderStateMixin {
  GifController controller;

  @override
  void initState() {
    controller = GifController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GifImage(
        controller: controller,
        image: AssetImage(
          'assets/secured.gif',
        ));
  }
}
