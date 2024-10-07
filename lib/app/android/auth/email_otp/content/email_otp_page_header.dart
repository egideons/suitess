import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../theme/colors.dart';

emailOTPPageHeader({
  ColorScheme? colorScheme,
  Size? media,
  String? title,
  String? subtitle,
  String? email,
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
        width: media!.width - 50,
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
                text: "$email ",
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
