import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../src/constants/consts.dart';

appBar(ColorScheme colorScheme, Size media, {Function()? goToSettings}) {
  return AppBar(
    backgroundColor: colorScheme.surface,
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        Icons.chevron_left,
        color: colorScheme.primary.withOpacity(.5),
      ),
    ),
    title: SizedBox(
      width: media.width / 2,
      child: Text(
        "Notifications",
        textAlign: TextAlign.center,
        style: defaultTextStyle(
          color: colorScheme.primary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    actions: [
      IconButton(
        onPressed: goToSettings ?? () {},
        icon: SvgPicture.asset(
          Assets.settingsOutlineSvg,
          fit: BoxFit.contain,
          color: colorScheme.primary.withOpacity(.5),
        ),
      ),
    ],
  );
}
