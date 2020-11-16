import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/template/app_bar_title_with_back_button.dart';
import 'package:flutter/material.dart';

class ExploreEvernote extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return ScaffoldWithBackButton(
      title: MetaText.exploreEvernote,
      child: Scrollbar(
        controller: _controller,
        child: ListView.builder(
          padding:
              EdgeInsets.symmetric(horizontal: _width * 0.04, vertical: 20),
          controller: _controller,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ExploreEvernoteItems(
              width: _width * 0.92,
            );
          },
        ),
      ),
    );
  }
}

class ExploreEvernoteItems extends StatelessWidget {
  final String title;
  final String subTitle;
  final String buttonText;
  final Function onPressed;
  final Widget icon;
  final Widget image;
  final double width;

  const ExploreEvernoteItems(
      {Key key,
      this.title,
      this.subTitle,
      this.buttonText,
      this.onPressed,
      this.icon,
      this.image,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor, width: 1),
          ),
          child: Column(
            children: [
              image,
              Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 15),
                child: Column(
                  children: [
                    Text(title),
                    Text(subTitle),
                    Row(
                        mainAxisAlignment: icon == null
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.spaceBetween,
                        children: [
                          icon,
                          TextButton(
                            child: Text(buttonText),
                            onPressed: () {},
                          ),
                        ])
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
