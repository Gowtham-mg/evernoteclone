import 'package:flutter/material.dart';

class FeatureItems extends StatelessWidget {
  final String feature;
  final IconData iconData;

  const FeatureItems({Key key, @required this.feature, this.iconData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        iconData == null
            ? Icon(
                Icons.check,
                color: Theme.of(context).accentColor,
              )
            : Icon(iconData),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            feature,
            style: Theme.of(context).textTheme.subtitle2,
            maxLines: 3,
          ),
        )
      ],
    );
  }
}
