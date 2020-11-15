import 'package:flutter/material.dart';

enum SlideAnimationType { LEFT, RIGHT, UP, DOWN }

class SlideAnimationRoute extends PageRouteBuilder {
  final Widget page;
  final SlideAnimationType slideAnimationType;
  SlideAnimationRoute({@required this.page, this.slideAnimationType})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            List<double> offset =
                getOffSetBasedOnSlideAnimationType(slideAnimationType);
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(offset.elementAt(0),offset.elementAt(1)),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

  static List<double> getOffSetBasedOnSlideAnimationType(
      SlideAnimationType slideAnimationType) {
    final offset = [0.0, 0.0];
    switch (slideAnimationType) {
      case SlideAnimationType.UP:
        offset[0] = 0;
        offset[1] = 1;
        break;
      case SlideAnimationType.DOWN:
        offset[0] = 0;
        offset[1] = -1;
        break;
      case SlideAnimationType.RIGHT:
        offset[0] = -1;
        offset[1] = 0;
        break;
      case SlideAnimationType.LEFT:
        offset[0] = 1;
        offset[1] = 0;
        break;
    }
    return offset;
  }
}