import 'package:flutter/material.dart';

import '../../../../src/constants/consts.dart';
import '../../../../theme/colors.dart';

profileSectionHeader({String? title}) {
  return Text(
    title ?? "",
    textAlign: TextAlign.start,
    style: defaultTextStyle(
      color: kTextBoldHeadingColor,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );
}
