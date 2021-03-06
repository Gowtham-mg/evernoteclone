import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({
    Key key,
    @required double width,
    @required this.text,
    @required this.onPressed,
  })  : _width = width,
        super(key: key);

  final double _width;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      padding: EdgeInsets.symmetric(vertical: 12),
      color: Colors.green,
      minWidth: _width,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}
