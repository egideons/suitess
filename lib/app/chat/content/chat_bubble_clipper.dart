import 'package:flutter/material.dart';

class ChatBubbleClipper extends CustomClipper<Path> {
  final bool isSender;

  ChatBubbleClipper({required this.isSender});

  @override
  Path getClip(Size size) {
    final path = Path();
    if (isSender) {
      path.moveTo(0, 0);
      path.lineTo(size.width - 10, 0);
      path.lineTo(size.width, 10);
      path.lineTo(size.width, size.height);
      path.lineTo(10, size.height);
      path.lineTo(0, size.height - 10);
      path.close();
    } else {
      path.moveTo(4, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height - 10);
      path.lineTo(size.width - 10, size.height);
      path.lineTo(0, size.height);
      path.lineTo(0, 10);
      path.close();
    }
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
