import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/assets.dart';
import '../../../../../constants/consts.dart';
import '../../../../../theme/colors.dart';

androidSearchResultsAndFilter(
  ColorScheme colorScheme,
  int? numOfResults,
  void Function()? filter,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        (numOfResults ?? 0) == 1
            ? "${formatIntNumber(numOfResults ?? 0)} Result found"
            : "${formatIntNumber(numOfResults ?? 0)} Results found",
        textAlign: TextAlign.center,
        style: defaultTextStyle(
          color: kTextBoldHeadingColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      InkWell(
        onTap: filter ?? () {},
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            SvgPicture.asset(
              Assets.searchFilterSvg,
              color: colorScheme.secondary,
            ),
            kHalfWidthSizedBox,
            Text(
              "Filter",
              textAlign: TextAlign.center,
              style: defaultTextStyle(
                color: colorScheme.secondary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
