import 'package:flutter/material.dart';

import '../../../../../constants/consts.dart';
import '../../../../../theme/colors.dart';

androidFilterScreenSectionHeader(String title) {
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
