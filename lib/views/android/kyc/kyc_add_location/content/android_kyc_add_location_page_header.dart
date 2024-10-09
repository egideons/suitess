import 'package:flutter/material.dart';
import 'package:suitess/constants/consts.dart';

androidKycAddLocationPageHeader({ColorScheme? colorScheme, Size? media}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.center,
        child: Text(
          "Choose your location",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: defaultTextStyle(
            fontSize: 24.0,
            color: colorScheme!.primary,
            letterSpacing: .90,
          ),
        ),
      ),
      kSizedBox,
      SizedBox(
        width: media!.width - 50,
        child: Text(
          "Let us know your location to provide better results within your area.",
          maxLines: 8,
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
