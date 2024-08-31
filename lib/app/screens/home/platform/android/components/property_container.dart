import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suitess/src/constants/consts.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../theme/colors.dart';

propertyContainer(
  Size media,
  ColorScheme colorScheme, {
  Function()? nav,
  String? propertyImage,
  String? tradeType,
  String? propertyName,
  int? propertyPrice,
  String? propertyPaymentFreq,
  String? propertyLocation,
  int? numOfBeds,
  int? numOfBaths,
}) {
  return GestureDetector(
    onTap: nav ?? () {},
    child: Column(
      children: [
        Stack(
          children: [
            Container(
              height: media.height * .3,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(propertyImage ?? ""),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
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
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        kHalfSizedBox,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                propertyName ?? "",
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: defaultTextStyle(
                  fontSize: 14,
                  color: kTextBoldHeadingColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text.rich(
              TextSpan(
                text: "$nairaSign ",
                style: defaultTextStyle(
                  fontFamily: "",
                  fontWeight: FontWeight.w800,
                  color: kTextBoldHeadingColor,
                  fontSize: 12,
                ),
                children: [
                  TextSpan(
                    text: "${formatIntNumber(propertyPrice ?? 0)}/",
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: propertyPaymentFreq,
                    style: defaultTextStyle(
                      fontWeight: FontWeight.normal,
                      color: kTextBoldHeadingColor,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Row(
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
              propertyLocation ?? "",
              overflow: TextOverflow.ellipsis,
              style: defaultTextStyle(
                fontSize: 12,
                color: colorScheme.inversePrimary,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  height: 20,
                  width: 20,
                  Assets.bedOutlineSvg,
                  color: colorScheme.primary.withOpacity(.5),
                  fit: BoxFit.contain,
                ),
                Text(
                  numOfBeds == 1 ? "$numOfBeds Bed" : "$numOfBeds Beds",
                  overflow: TextOverflow.ellipsis,
                  style: defaultTextStyle(
                    fontSize: 10,
                    color: colorScheme.inversePrimary,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            kWidthSizedBox,
            Row(
              children: [
                SvgPicture.asset(
                  height: 20,
                  width: 20,
                  Assets.bathOutlineSvg,
                  color: colorScheme.primary.withOpacity(.5),
                  fit: BoxFit.contain,
                ),
                Text(
                  numOfBaths == 1 ? "$numOfBaths Bath" : "$numOfBaths Baths",
                  overflow: TextOverflow.ellipsis,
                  style: defaultTextStyle(
                    fontSize: 10,
                    color: colorScheme.inversePrimary,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
