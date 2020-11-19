import 'package:flutter/material.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.onPressed,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(title),
          )
        ],
      ),
    );
  }
}