import 'package:evernote/blocs/drawer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    String selectedTitle = context.watch<DrawerCubit>().state;
    bool isLight = Theme.of(context).brightness == Brightness.light;
    return MaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          Icon(
            icon,
            color: getColor(context, selectedTitle == title, isLight),
            size: Theme.of(context).accentIconTheme.size,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                color: getColor(context, selectedTitle == title, isLight)
              ),
            ),
          )
        ],
      ),
    );
  }

  Color getColor(context, bool isSelected, bool isLight) {
    if (isSelected) {
      if (isLight) return Colors.green;
      return Colors.white;
    }
    if(isLight) return Colors.grey.shade700;
    return Colors.white70;
  }
}
