import 'package:evernote/blocs/all_notes_cubit.dart';
import 'package:evernote/blocs/data_connection.dart';
import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/routes/routes.dart';
import 'package:evernote/template/scaffold_with_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllNotes extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _isConnected = context.watch<ConnectionHelperCubit>().state;
    AllNotesSelectedCubit _allNotesSelectedCubit =
        context.watch<AllNotesSelectedCubit>();
    return ScaffoldWithAppBar(
      title: MetaText.allNotes,
      actions: [
        actionButton(() {
          Navigator.pushNamed(
              context,
              _isConnected
                  ? Routes.susbcriptionOnline
                  : Routes.susbcriptionOffline);
        },
            SvgPicture.asset(
              'assets/flash.svg',
              color: Theme.of(context).primaryIconTheme.color,
              height: Theme.of(context).appBarTheme.iconTheme.size * 1.05,
              width: Theme.of(context).appBarTheme.iconTheme.size * 1.05,
            )),
        actionButton(() {
          Navigator.pushNamed(context, Routes.searchNotes);
        }, Icon(Icons.search)),
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
          onSelected: (String selected) {
            if (selected == MetaText.selectNotes) {
              _allNotesSelectedCubit.updateVal(_allNotesSelectedCubit.state
                  .copyWith(select: true));
            }
          },
        ),
      ],
      child: Scrollbar(
        controller: _scrollController,
        radius: Radius.circular(5),
        isAlwaysShown: false,
        thickness: 5,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              left: _width * 0.04, right: _width * 0.04, top: 20, bottom: 70),
          controller: _scrollController,
          child: Column(
            children: [
              // DecoratedBox(
              //     decoration: BoxDecoration(
              //       border: Border.all(
              //           color: Theme.of(context).dividerColor, width: 0.5),
              //     ),
              //     child: Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(top: 2),
              //           child: SizedBox(
              //               height: 100,
              //               width: _width * 0.92,
              //               child: SercuredGif()),
              //         ),
              //         Padding(
              //           padding: EdgeInsets.only(
              //               left: _width * 0.05,
              //               right: _width * 0.05,
              //               top: 12,
              //               bottom: 10),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 MetaText.protectYourNotes,
              //                 style:
              //                     Theme.of(context).primaryTextTheme.headline6,
              //               ),
              //               Padding(
              //                 padding: const EdgeInsets.only(top: 10),
              //                 child: Text(
              //                   MetaText.protectYourNotesDescription,
              //                   style: Theme.of(context)
              //                       .primaryTextTheme
              //                       .headline5,
              //                 ),
              //               ),
              //               Container(
              //                 width: _width * 0.82,
              //                 alignment: Alignment.bottomRight,
              //                 child: TextButton(
              //                   child: Text(
              //                     MetaText.setPasscode,
              //                     style:
              //                         Theme.of(context).primaryTextTheme.button,
              //                   ),
              //                   onPressed: () {},
              //                 ),
              //               )
              //             ],
              //           ),
              //         )
              //       ],
              //     )),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                            color: Theme.of(context).dividerColor,
                            width: 0.5,
                          ),
                          bottom: BorderSide(
                            color: Theme.of(context).dividerColor,
                            width: 0.5,
                          )),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('24/04/2021',
                            style: Theme.of(context).textTheme.headline6),
                        Text('Title dsasdksdfvnxckcv dcsadf',
                            style: Theme.of(context).textTheme.headline5),
                        Text(
                            'description cbzcbs hasdhasdbxzc dhiosadhjxcxbc zasdjsahdsnBczx csjdaidhaschzxc dhdhjhczxncnzdcsda sscichzxcjsddbc zchiasdchshcjsadczs',
                            style: Theme.of(context).textTheme.bodyText2),
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
