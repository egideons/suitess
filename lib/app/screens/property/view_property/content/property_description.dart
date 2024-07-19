import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../theme/colors.dart';

propertyDescription(ColorScheme colorScheme, {String? descriptionText}) {
  return ReadMoreText(
    descriptionText ?? "",
    textAlign: TextAlign.start,
    colorClickableText: kAccentColor,
    delimiter: "...",
    trimLines: 10,
    trimMode: TrimMode.Line,
    delimiterStyle: defaultTextStyle(
      color: kAccentColor,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    style: defaultTextStyle(
      color: colorScheme.inversePrimary,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
  );
}
