import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../src/constants/assets.dart';
import '../../../../src/constants/consts.dart';
import '../../../../theme/colors.dart';

searchResultsAndFilter(
  int? numOfResults,
  void Function()? filter,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "${formatIntNumber(numOfResults ?? 0)} Results found",
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
              color: kAccentColor,
            ),
            kHalfWidthSizedBox,
            Text(
              "Filter",
              textAlign: TextAlign.center,
              style: defaultTextStyle(
                color: kAccentColor,
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
