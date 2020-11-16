import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/scaffold_with_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseNotebook extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  final List<String> recentNotebooks = ['aas', 'asdasd', 'fdsdf'];
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppBar(
      title: MetaText.chooseNotebook,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset('assets/notebook-add.svg'),
          onPressed: () {},
        ),
      ],
      child: Scrollbar(
        controller: _controller,
        child: ListView(
          controller: _controller,
          children: [
            Text(MetaText.recentNotebook),
            ...recentNotebooks
                .map((notebook) => Row(
                      children: [
                        Icon(Icons.check),
                        SvgPicture.asset('assets/note1.svg'),
                        Text(notebook)
                      ],
                    ))
                .toList(),
            Text(MetaText.notebooks),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container();
              },
              itemCount: 10,
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: TextButton(
                child: Text(MetaText.choose),
                onPressed: (){},
              ),
            )
          ],
        ),
      ),
    );
  }
}
