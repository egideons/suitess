import 'package:flutter/material.dart';

import '../../../../src/constants/consts.dart';

signupFormPageHeader({colorScheme, media}) {
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
            text: "Create ",
            style: defaultTextStyle(
              fontSize: 20.0,
              color: colorScheme.primary,
            ),
            children: [
              // TextSpan(
              //   text: " Suitess ",
              //   style: defaultTextStyle(
              //     fontSize: 20.0,
              //     color: kSuccessColor,
              //   ),
              // ),
              TextSpan(
                text: "account",
                style: defaultTextStyle(
                  fontSize: 20.0,
                  color: colorScheme.primary,
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
          "Register now, suitess has got you covered.",
          textAlign: TextAlign.center,
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
