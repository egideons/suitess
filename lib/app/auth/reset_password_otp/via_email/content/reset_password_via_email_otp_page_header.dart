import 'package:flutter/material.dart';

import '../../../../../src/constants/consts.dart';

resetPasswordViaEmailOTPPageHeader({
  colorScheme,
  media,
  title,
  subtitle,
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
            color: colorScheme.primary,
          ),
        ),
      ),
      kSizedBox,
      SizedBox(
        width: media.width - 50,
        child: Text(
          subtitle ?? "",
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
