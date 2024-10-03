import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:suitess/src/constants/consts.dart';

resetTxPinOptionHeader(
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
        "Reset Transaction Pin",
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
          text: "Enter your registered $registeredOption to receive an otp.\n",
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
