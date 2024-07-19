import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../src/constants/consts.dart';

emptyNotifications(
  Size media,
  ColorScheme colorScheme, {
  String? title,
  String? message,
}) {
  return Container(
    height: media.height / 2,
    width: media.width,
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.noNotificationsSvg,
          height: media.height / 6,
          fit: BoxFit.cover,
        ),
        kSizedBox,
        Text(
          title ?? "Oops",
          textAlign: TextAlign.center,
          style: defaultTextStyle(
            color: colorScheme.inversePrimary,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        kHalfSizedBox,
        Text(
          message ??
              "You're all caught up! We'll notify you when there's something new.",
          maxLines: 4,
          textAlign: TextAlign.center,
          style: defaultTextStyle(
            color: colorScheme.inversePrimary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
