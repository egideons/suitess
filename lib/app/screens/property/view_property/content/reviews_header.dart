import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suitess/src/constants/assets.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../theme/colors.dart';

reviewsHeader(ColorScheme colorScheme,
    {Function()? review, int? numOfReviews}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Text(
          "Reviews ($numOfReviews)",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: defaultTextStyle(
            color: kTextBoldHeadingColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      InkWell(
        onTap: review ?? () {},
        borderRadius: BorderRadius.circular(24),
        enableFeedback: true,
        mouseCursor: SystemMouseCursors.cell,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              SvgPicture.asset(
                Assets.penOutlineSvg,
                color: kAccentColor,
              ),
              Text(
                "Write Review",
                style: defaultTextStyle(
                  color: kAccentColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}
