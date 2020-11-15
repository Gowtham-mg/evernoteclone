import 'package:flutter/material.dart';

class UpgradePlanCustomClipperBasic extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 75);
    path.quadraticBezierTo(size.width * 0.25, 100, size.width * 0.5, 75);
    path.quadraticBezierTo(size.width * 0.75, 65, size.width, 75);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}

class UpgradePlanCustomClipperPremium extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height + 50);
    path.quadraticBezierTo(size.width * 0.25, size.height + 25,
        size.width * 0.5, size.height + 50);
    path.quadraticBezierTo(
        size.width * 0.75, size.height + 25, size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
