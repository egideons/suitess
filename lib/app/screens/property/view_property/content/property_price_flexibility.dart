import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';

priceFlexibility(ColorScheme colorScheme, {bool? isNegotiable}) {
  return Row(
    children: [
      Expanded(
        child: Row(
          children: [
            SvgPicture.asset(
              Assets.greenDotSvg,
            ),
            kHalfWidthSizedBox,
            Text(
              isNegotiable == true ? "Negotiable" : "Non-Negotiable",
              overflow: TextOverflow.ellipsis,
              style: defaultTextStyle(
                fontSize: 12,
                color: colorScheme.inversePrimary,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      isNegotiable == true
          ? Expanded(
              child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: colorScheme.inversePrimary.withOpacity(.4),
                    ),
                  ),
                ),
                child: LinearProgressIndicator(
                  value: 0,
                  minHeight: 10,
                  backgroundColor: colorScheme.inversePrimary.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    colorScheme.secondary,
                  ),
                ),
              ),
            )
          : const SizedBox(),
    ],
  );
}
