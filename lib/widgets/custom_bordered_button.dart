import 'package:flutter/material.dart';

class BorderedButton extends StatelessWidget {
  const BorderedButton({
    Key key,
    double width,
    @required this.child,
    @required this.onPressed, this.color,
  })  : _width = width,
        super(key: key);

  final double _width;
  final Widget child;
  final Color color;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            side: BorderSide(color: color ?? Theme.of(context).accentColor)),
        padding: EdgeInsets.symmetric(vertical: 5),
        minWidth: _width,
        child: child);
  }
}
