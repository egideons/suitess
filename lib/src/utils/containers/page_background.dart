import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';

Widget pageBackground(Size media, ColorScheme colorScheme) {
  return Container(
    height: media.height,
    width: media.width,
    decoration: BoxDecoration(
      color: colorScheme.surface,
      image: DecorationImage(
        image: AssetImage(
          Get.isDarkMode ? Assets.darkBackground : Assets.lightBackground,
        ),
        fit: BoxFit.cover,
      ),
    ),
  );
}
