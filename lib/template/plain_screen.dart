import 'package:flutter/material.dart';

class PlainScreen extends StatelessWidget {
  final Widget child;

  const PlainScreen({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: child,
      ),
    );
  }
}