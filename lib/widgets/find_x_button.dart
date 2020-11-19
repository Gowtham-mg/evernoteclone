import 'package:flutter/material.dart';

class FindXButton extends StatelessWidget {
  const FindXButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).appBarTheme.color),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        margin: EdgeInsets.symmetric(horizontal: _width * 0.04, vertical: 20),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Theme.of(context).iconTheme.color,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                text,
                style: Theme.of(context).textTheme.headline6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
