import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/plain_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchNotebooks extends StatelessWidget {
  final TextEditingController _findNotebookController = TextEditingController();
  final FocusNode _findNotebookFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return PlainScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _findNotebookController,
            focusNode: _findNotebookFocusNode,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                fillColor: Colors.grey,
                suffixIcon: CloseButton(
                  // color: ,
                  onPressed: () {
                    _findNotebookController.clear();
                  },
                ),
                prefixIcon: CloseButton(
                  // color: ,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                hintText: MetaText.findANotebook),
          ),
        ],
      ),
    );
  }
}

class NoSearchMatches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Spacer(
            flex: 1,
          ),
          SvgPicture.asset(
            'assets/note1.svg',
            height: Theme.of(context).primaryIconTheme.size,
            width: Theme.of(context).primaryIconTheme.size,
          ),
          Text(MetaText.tryAnotherSearch,
              style: Theme.of(context).textTheme.bodyText1),
          Text(MetaText.tryAnotherSearchDescription,
              style: Theme.of(context).textTheme.bodyText2),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
