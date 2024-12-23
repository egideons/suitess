import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../../constants/consts.dart';
import '../../../../../../../theme/colors.dart';

androidFaqsExpansionTile(ColorScheme colorScheme,
    {String? title, String? content}) {
  return ExpansionTile(
    iconColor: colorScheme.inversePrimary.withOpacity(.6),
    collapsedIconColor: colorScheme.inversePrimary.withOpacity(.6),
    title: Text(
      title ?? "",
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: defaultTextStyle(
        color: kTextGreyColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    shape: RoundedRectangleBorder(
      side: BorderSide(color: kTransparentColor),
    ),
    childrenPadding: const EdgeInsets.all(10),
    children: [
      ReadMoreText(
        content ?? "",
        trimMode: TrimMode.Line,
        trimLines: 6,
        textAlign: TextAlign.start,
        style: defaultTextStyle(
          color: kTextBoldHeadingColor,
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
      ),
    ],
  );
}
