import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../src/constants/consts.dart';

Widget homeScreenNoProperties(Size media, ColorScheme colorScheme) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Iconsax.cloud_remove,
        size: media.height * .12,
        color: colorScheme.inversePrimary,
      ),
      kSizedBox,
      SizedBox(
        width: media.width - 150,
        child: Text(
          "No properties yet",
          textAlign: TextAlign.center,
          style: defaultTextStyle(
            color: colorScheme.inversePrimary,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.90,
          ),
        ),
      ),
    ],
  );
}
