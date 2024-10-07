import 'package:flutter/material.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../theme/colors.dart';

sectionHeader(String? title) {
  return Text(
    title ?? "",
    textAlign: TextAlign.start,
    overflow: TextOverflow.ellipsis,
    style: defaultTextStyle(
      fontSize: 14,
      color: kTextBoldHeadingColor,
      fontWeight: FontWeight.w700,
    ),
  );
}
