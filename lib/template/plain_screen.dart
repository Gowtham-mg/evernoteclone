import 'package:flutter/material.dart';

class PlainScreen extends StatelessWidget {
  final Widget child;
  final Color color;
  const PlainScreen({Key key, this.child, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: color ?? Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: child,
      ),
    );
  }
}