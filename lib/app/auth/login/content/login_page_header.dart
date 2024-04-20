import 'package:flutter/material.dart';

import '../../../../src/constants/consts.dart';
import '../../../../theme/colors.dart';

Widget loginPageHeader({colorScheme, media}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.center,
        child: RichText(
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Welcome back to ",
            style: defaultTextStyle(
              fontSize: 24.0,
              color: colorScheme.primary,
              letterSpacing: .90,
            ),
            children: [
              TextSpan(
                text: "Kribb",
                style: defaultTextStyle(
                  fontSize: 24.0,
                  color: kAccentColor,
                  letterSpacing: .90,
                ),
              ),
            ],
          ),
        ),
      ),
      kSizedBox,
      SizedBox(
        width: media.width - 50,
        child: Text(
          "Login to continue",
          textAlign: TextAlign.center,
          style: defaultTextStyle(
            color: colorScheme.inversePrimary,
            fontSize: 14.0,
          ),
        ),
      ),
    ],
  );
}
