import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../src/constants/consts.dart';

propertyDescription(ColorScheme colorScheme, {String? descriptionText}) {
  return ReadMoreText(
    descriptionText ?? "",
    textAlign: TextAlign.start,
    colorClickableText: colorScheme.secondary,
    delimiter: "...",
    trimLines: 10,
    trimMode: TrimMode.Line,
    delimiterStyle: defaultTextStyle(
      color: colorScheme.secondary,
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
