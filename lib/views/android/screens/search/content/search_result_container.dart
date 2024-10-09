import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants/assets.dart';
import '../../../../../constants/consts.dart';
import '../../../../../theme/colors.dart';

searchResultContainer(
  ColorScheme colorScheme,
  Size media, {
  void Function()? onTap,
  String? tradeType,
  String? propertyName,
  double? propertyPrice,
  String? paymentFreq,
  String? propertyLocation,
  int? numOfBeds,
  int? numOfBaths,
}) {
  return InkWell(
    onTap: onTap ?? () {},
    borderRadius: BorderRadius.circular(12),
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            width: .5,
            color: colorScheme.inversePrimary,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: media.height * .15,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    image: const DecorationImage(
                      image: AssetImage(Assets.duplex1),
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
          ),
          kHalfWidthSizedBox,
          SizedBox(
            width: media.width / 1.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            propertyName ?? "",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: defaultTextStyle(
                              fontSize: 14,
                              color: kTextBoldHeadingColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SvgPicture.asset(Assets.goldenTickSvg),
                      ],
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
                            text:
                                "${formatDoubleNumber(propertyPrice ?? 0.0)}/",
                            style: defaultTextStyle(
                              color: kTextBoldHeadingColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: paymentFreq ?? "",
                            style: defaultTextStyle(
                              fontWeight: FontWeight.normal,
                              color: kTextBoldHeadingColor,
                              fontSize: 10,
                            ),
                          )
                        ],
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
                  ],
                ),
                kSizedBox,
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
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
