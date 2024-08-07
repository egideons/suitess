import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';
import '../../../../../theme/colors.dart';

referenceBookingApartment(
  ColorScheme colorScheme,
  Size media, {
  String? tradeType,
  String? propertyName,
  String? propertyLocation,
  int? numOfBeds,
  int? numOfBaths,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: media.height * .14,
        width: media.width * .26,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          image: const DecorationImage(
            image: AssetImage(Assets.duplex1),
            fit: BoxFit.cover,
          ),
        ),
      ),
      kHalfWidthSizedBox,
      Expanded(
        child: Column(
          children: [
            Text(
              propertyName ?? "",
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: defaultTextStyle(
                fontSize: 14,
                color: kTextBoldHeadingColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            kSmallSizedBox,
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
                Expanded(
                  child: Text(
                    propertyLocation ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: defaultTextStyle(
                      fontSize: 12,
                      color: colorScheme.inversePrimary,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            kHalfSizedBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      numOfBaths == 1
                          ? "$numOfBaths Bath"
                          : "$numOfBaths Baths",
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
            kHalfSizedBox,
            Row(
              children: [
                Text(
                  "Status:",
                  style: defaultTextStyle(
                    fontSize: 12,
                    color: kGreyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                kHalfWidthSizedBox,
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
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
