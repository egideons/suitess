import 'package:flutter/material.dart';

Widget formFieldContainer(colorScheme, media,
    {child, containerHeight, containerWidth, padding}) {
  return Container(
    width: containerWidth ?? media.width,
    height: containerHeight ?? media.height * 0.06,
    padding: padding,
    decoration: ShapeDecoration(
      color: colorScheme.inversePrimary.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colorScheme.inversePrimary, width: 0.2),
      ),

      // shadows: [
      //   BoxShadow(
      //     color: const Color(0x0C000000),
      //     blurRadius: 10,
      //     offset: const Offset(0, 4),
      //     spreadRadius: Get.isDarkMode ? 20 : 10,
      //   ),

      // ],
    ),
    child: child,
  );
}
