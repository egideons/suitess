import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../constants/consts.dart';

androidViewPropertyUserReview(ColorScheme colorScheme, {String? statement}) {
  return ReadMoreText(
    statement ?? "",
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
