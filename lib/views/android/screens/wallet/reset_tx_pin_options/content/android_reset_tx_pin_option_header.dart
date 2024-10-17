import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:suitess/constants/consts.dart';

androidResetTxPinOptionHeader(
  ColorScheme colorScheme,
  controller, {
  registeredOption,
  resetOption,
  resetVia,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Reset Pin",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: defaultTextStyle(
          fontSize: 24.0,
          color: colorScheme.primary,
        ),
      ),
      kSizedBox,
      Text.rich(
        maxLines: 4,
        textAlign: TextAlign.center,
        TextSpan(
          text:
              "We will send a verification code to your registered $registeredOption. ",
          style: defaultTextStyle(
            color: colorScheme.primary,
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
          children: [
            TextSpan(
              text: "Reset via $resetOption",
              mouseCursor: SystemMouseCursors.click,
              recognizer: TapGestureRecognizer()..onTap = resetVia ?? () {},
              style: defaultTextStyle(
                color: colorScheme.primary,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
