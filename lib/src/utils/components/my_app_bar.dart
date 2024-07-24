import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../src/constants/consts.dart';
import '../../../../../../../../theme/colors.dart';

myAppBar(
  ColorScheme colorScheme,
  Size media, {
  bool? centerTitle,
  String? title,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: colorScheme.surface,
    centerTitle: centerTitle ?? true,
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
        title ?? "",
        textAlign: TextAlign.center,
        style: defaultTextStyle(
          color: kTextBoldHeadingColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    actions: actions ?? [],
  );
}
