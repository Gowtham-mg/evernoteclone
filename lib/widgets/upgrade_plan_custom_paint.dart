// import 'package:flutter/material.dart';

// class UpgradePlanCustomPainterBasic extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Path path = Path();
//     path.moveTo(0, 75);
//     path.quadraticBezierTo(size.width * 0.25, size.height, size.width * 0.5, size.height);
//     path.quadraticBezierTo(size.width * 0.75, 65, size.width, 75);
//     path.close();
//     Paint paint = Paint();
//     paint.color = Colors.grey.shade100;
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

// class UpgradePlanCustomPainterPremium extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Path path = Path();
//     path.moveTo(0, size.height + 50);
//     path.quadraticBezierTo(size.width * 0.25, size.height + 25,
//         size.width * 0.5, size.height + 50);
//     path.quadraticBezierTo(
//         size.width * 0.75, size.height + 25, size.width, size.height);
//     path.close();
//     Paint paint = Paint();
//     paint.color = Colors.green;
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
