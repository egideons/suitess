import 'package:flutter/material.dart';

import '../../../../../constants/consts.dart';
import '../../../../../theme/colors.dart';

androidSignupPageHeader() {
  return Container(
    height: 220.0,
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Welcome to suitess",
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
          "Let's get you started",
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
