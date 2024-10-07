import 'package:flutter/material.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../theme/colors.dart';

Widget loginPageHeader({colorScheme, media}) {
  return Container(
    height: 250.0,
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Welcome back!",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          maxLines: 4,
          style: defaultTextStyle(
            fontSize: 24,
            color: kTextWhiteColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          "Login to continue",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          maxLines: 4,
          style: defaultTextStyle(
            fontSize: 12,
            color: kTextWhiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
