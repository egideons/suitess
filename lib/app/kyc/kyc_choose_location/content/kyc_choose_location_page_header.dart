import 'package:flutter/material.dart';
import 'package:kribb/src/constants/consts.dart';

Widget kycChooseLocationPageHeader({colorScheme, media}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.center,
        child: Text(
          "Add your location",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: defaultTextStyle(
            fontSize: 24.0,
            color: colorScheme.primary,
            letterSpacing: .90,
          ),
        ),
      ),
      kSizedBox,
      SizedBox(
        width: media.width - 50,
        child: Text(
          "Let us know your location to provide better results within your area.",
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
