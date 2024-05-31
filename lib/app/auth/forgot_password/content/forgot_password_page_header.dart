import 'package:flutter/material.dart';

import '../../../../src/constants/consts.dart';

Widget forgotPasswordPageHeader({colorScheme, media, title, subtitle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        title ?? "",
        overflow: TextOverflow.ellipsis,
        maxLines: 4,
        textAlign: TextAlign.center,
        style: defaultTextStyle(
          fontSize: 24.0,
          color: colorScheme.primary,
        ),
      ),
      kSizedBox,
      Text(
        subtitle ?? "",
        maxLines: 4,
        textAlign: TextAlign.center,
        style: defaultTextStyle(
          color: colorScheme.primary,
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    ],
  );
}
