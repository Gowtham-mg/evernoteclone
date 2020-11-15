import 'package:flutter/material.dart';

class BorderedButton extends StatelessWidget {
  const BorderedButton({
    Key key,
    @required double width,
    this.child,
  })  : _width = width,
        super(key: key);

  final double _width;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            side: BorderSide(color: Theme.of(context).primaryColor)),
        padding: EdgeInsets.symmetric(vertical: 5),
        minWidth: _width,
        child: child);
  }
}