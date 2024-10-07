import 'package:flutter/material.dart';
import 'package:suitess/src/constants/consts.dart';

resetTxPinOTPPageHeader({
  ColorScheme? colorScheme,
  Size? media,
  String? title,
  String? subtitle,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.center,
        child: Text(
          title ?? "",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: defaultTextStyle(
            fontSize: 24.0,
            color: colorScheme!.primary,
          ),
        ),
      ),
      kSizedBox,
      SizedBox(
        width: media!.width - 40,
        child: Text(
          subtitle ?? "",
          maxLines: 10,
          textAlign: TextAlign.center,
          style: defaultTextStyle(
            color: colorScheme.primary,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ],
  );
}
