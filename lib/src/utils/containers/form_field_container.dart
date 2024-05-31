import 'package:flutter/material.dart';
import 'package:suitess/theme/colors.dart';

Widget formFieldContainer(colorScheme, media,
    {child, containerHeight, containerWidth, padding, color, borderSide}) {
  return Container(
    width: containerWidth ?? media.width,
    height: containerHeight ?? media.height * 0.06,
    padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
    decoration: ShapeDecoration(
      color: color ?? kTransparentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: colorScheme.primary, width: 0.2),
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
    child: Center(
      child: child,
    ),
  );
}
