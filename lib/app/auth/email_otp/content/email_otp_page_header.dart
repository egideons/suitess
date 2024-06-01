import 'package:flutter/material.dart';

import '../../../../src/constants/consts.dart';

emailOTPPageHeader({
  colorScheme,
  media,
  title,
  subtitle,
  email,
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
        width: media.width - 100,
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
                text: email,
                style: defaultTextStyle(
                  color: colorScheme.primary,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
