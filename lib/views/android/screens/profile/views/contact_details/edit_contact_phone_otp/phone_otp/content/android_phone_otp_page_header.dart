import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:suitess/theme/colors.dart';

import '../../../../../../../../../constants/consts.dart';

androidEditContactPhoneOTPPageHeader({
  ColorScheme? colorScheme,
  Size? media,
  String? title,
  String? subtitle,
  String? phoneNumber,
  String? otpOption,
  void Function()? signupVia,
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
        width: media!.width - 80,
        child: RichText(
          textAlign: TextAlign.center,
          maxLines: 10,
          text: TextSpan(
            text: subtitle,
            style: defaultTextStyle(
              color: colorScheme.primary,
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
            ),
            children: [
              TextSpan(
                text: "$phoneNumber ",
                style: defaultTextStyle(
                  color: colorScheme.primary,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: "Send to $otpOption",
                mouseCursor: SystemMouseCursors.click,
                recognizer: TapGestureRecognizer()..onTap = signupVia ?? () {},
                style: defaultTextStyle(
                  color: kSuccessColor,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
