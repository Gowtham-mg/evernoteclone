import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/scaffold_with_appbar.dart';
import 'package:flutter/material.dart';

class Trash extends StatelessWidget {
  final String date = 'Nov 2020';
  final String title =
      'fdsfkzxcnbxcnvmnfcjksdAfhsdfdx c xzjnczXFvjksdcczxcC zxcszKDFksZDfc';
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return ScaffoldWithAppBar(
      title: MetaText.trash,
      showFloatingActionBar: false,
      child: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.symmetric(horizontal: _width * 0.05, vertical: 20),
        itemBuilder: (BuildContext context, int index) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text('24/04/2021',
                      style: Theme.of(context).textTheme.headline6),
                ),
                Container(
                    decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                            color:
                                Theme.of(context).dividerColor.withOpacity(0.4),
                            width: 0.5,
                          ),
                          bottom: BorderSide(
                            color:
                                Theme.of(context).dividerColor.withOpacity(0.4),
                            width: 0.5,
                          )),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(date),
                        Text(title),
                      ],
                    ))
              ]);
        },
      ),
    );
  }
}
