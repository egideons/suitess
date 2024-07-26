import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../src/constants/consts.dart';
import '../../../../../../../../theme/colors.dart';

myAppBar(
  ColorScheme colorScheme,
  Size media, {
  Color? backgroundColor,
  bool? centerTitle,
  String? title,
  bool? automaticallyImplyLeading,
  double? leadingWidth,
  Widget? titleWidget,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: backgroundColor ?? colorScheme.surface,
    centerTitle: centerTitle ?? true,
    automaticallyImplyLeading: automaticallyImplyLeading ?? false,
    leadingWidth: leadingWidth ?? 56.0,
    leading: Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.chevron_left,
          size: 26,
          color: kAppBarIconColor,
        ),
      ),
    ),
    title: titleWidget ??
        SizedBox(
          width: media.width / 1.6,
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
