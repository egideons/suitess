import 'package:flutter/material.dart';

import '../../../../../src/constants/consts.dart';

resetPasswordViaSMSOTPPageHeader({
  colorScheme,
  media,
  title,
  subtitle,
  phoneNumber,
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
                text: phoneNumber,
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
