import 'package:flutter/material.dart';

import '../../../../src/constants/consts.dart';
import '../../../../theme/colors.dart';

filterScreenSectionHeader(String title) {
  return Text(
    title,
    textAlign: TextAlign.start,
    style: defaultTextStyle(
      color: kTextBoldHeadingColor,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  );
}
