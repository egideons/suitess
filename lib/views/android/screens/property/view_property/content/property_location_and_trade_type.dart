import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../src/constants/consts.dart';
import '../../../../../../theme/colors.dart';

propertyLocationAndTradeType(ColorScheme colorScheme,
    {String? location, String? tradeType}) {
  return Row(
    children: [
      Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              height: 20,
              width: 20,
              Assets.locationPinOutlineIconSvg,
              color: colorScheme.primary.withOpacity(.5),
              fit: BoxFit.contain,
            ),
            Text(
              location ?? "",
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
      Container(
        padding: const EdgeInsets.all(4),
        decoration: ShapeDecoration(
          color: kBannerBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Center(
          child: Text(
            tradeType ?? "",
            textAlign: TextAlign.center,
            style: defaultTextStyle(
              fontSize: 10,
              color: kBannerTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}
