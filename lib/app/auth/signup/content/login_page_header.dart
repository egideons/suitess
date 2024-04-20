import 'package:flutter/material.dart';

import '../../../../src/constants/consts.dart';
import '../../../../theme/colors.dart';

Widget signupPageHeader({colorScheme, media}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      kSizedBox,
      kSizedBox,
      Container(
        alignment: Alignment.center,
        child: RichText(
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Welcome",
            style: defaultTextStyle(
              fontSize: 24.0,
              color: colorScheme.primary,
              letterSpacing: .90,
            ),
            children: [
              TextSpan(
                text: " to ",
                style: defaultTextStyle(
                  fontSize: 24.0,
                  color: colorScheme.primary,
                  letterSpacing: .90,
                ),
              ),
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
    ],
  );
}
