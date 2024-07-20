import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../src/constants/consts.dart';
import '../../../../../../../../theme/colors.dart';

contactDetailsAppBar(ColorScheme colorScheme, Size media) {
  return AppBar(
    backgroundColor: colorScheme.surface,
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        Icons.chevron_left,
        color: kAppBarIconColor,
      ),
    ),
    title: SizedBox(
      width: media.width / 2,
      child: Text(
        "Contact details",
        textAlign: TextAlign.center,
        style: defaultTextStyle(
          color: kTextBoldHeadingColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    actions: const [],
  );
}
