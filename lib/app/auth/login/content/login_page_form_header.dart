import 'package:flutter/material.dart';

import '../../../../src/constants/consts.dart';
import '../../../../theme/colors.dart';

loginFormPageHeader({colorScheme, media}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.center,
        child: RichText(
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          maxLines: 4,
          text: TextSpan(
            text: "Login to",
            style: defaultTextStyle(
              fontSize: 20.0,
              color: colorScheme.primary,
            ),
            children: [
              TextSpan(
                text: " Suitess",
                style: defaultTextStyle(
                  fontSize: 20.0,
                  color: kSuccessColor,
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
          "Looking for that perfect home just for you?\n Suitess has got you covered.",
          textAlign: TextAlign.center,
          maxLines: 4,
          style: defaultTextStyle(
            color: colorScheme.primary,
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ],
  );
}
