import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../src/constants/consts.dart';
import '../../../../../../theme/colors.dart';

atmCardExpansionTile(ColorScheme colorScheme, {List<Widget>? children}) {
  return Container(
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          width: .5,
          color: colorScheme.inversePrimary.withOpacity(.4),
        ),
      ),
    ),
    child: ExpansionTile(
      childrenPadding: const EdgeInsets.all(10),
      tilePadding: const EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: kTransparentColor),
      ),
      dense: true,
      initiallyExpanded: true,
      title: Row(
        children: [
          SvgPicture.asset(
            Assets.creditCardFilledSvg,
            color: colorScheme.secondary,
          ),
          kHalfWidthSizedBox,
          Text(
            "ATM Card",
            style: defaultTextStyle(
              color: kTextBoldHeadingColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      children: children ?? [],
    ),
  );
}
