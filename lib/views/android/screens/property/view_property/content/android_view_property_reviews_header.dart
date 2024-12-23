import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suitess/constants/assets.dart';

import '../../../../../../../constants/consts.dart';
import '../../../../../../../theme/colors.dart';

androidViewPropertyReviewsHeader(ColorScheme colorScheme,
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
                color: colorScheme.secondary,
              ),
              Text(
                "Write Review",
                style: defaultTextStyle(
                  color: colorScheme.secondary,
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
