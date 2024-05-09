import 'package:flutter/widgets.dart';
import 'package:readmore/readmore.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../theme/colors.dart';

Widget viewPropertyDescription(colorScheme, {descriptionText}) {
  return ReadMoreText(
    descriptionText ?? "",
    textAlign: TextAlign.start,
    colorClickableText: kAccentColor,
    delimiter: "...",
    trimLines: 4,
    trimMode: TrimMode.Line,
    delimiterStyle: defaultTextStyle(
      color: kAccentColor,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    style: defaultTextStyle(
      color: colorScheme.inversePrimary,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
  );
}
