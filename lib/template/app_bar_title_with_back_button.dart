import 'package:flutter/material.dart';

class ScaffoldWithBackButton extends StatelessWidget {
  final String title;
  final Widget child;

  const ScaffoldWithBackButton({Key key, @required this.title, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          title: Text(title),
        ),
        body: child,
      ),
    );
  }
}
