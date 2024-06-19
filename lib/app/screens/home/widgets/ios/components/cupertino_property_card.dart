import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../src/constants/consts.dart';
import '../../../../../../theme/colors.dart';

Widget homeScreenCupertinoPropertyCard(
  colorScheme,
  media, {
  goToProperty,
  propertyName,
  propertyRating,
  propertyLocation,
  propertyPrice,
  propertyPaymentFreq,
}) {
  return CupertinoButton(
    onPressed: goToProperty ?? () {},
    padding: const EdgeInsets.all(0),
    borderRadius: BorderRadius.circular(24),
    pressedOpacity: .6,
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: colorScheme.inversePrimary.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Image.asset(Assets.buildings),
          ),
          kHalfWidthSizedBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: media.width - 180,
                child: Text(
                  propertyName ?? "",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: defaultTextStyle(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              kHalfSizedBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.magic_star5,
                    color: kStarColor,
                    size: 14,
                  ),
                  Text(
                    propertyRating ?? "",
                    textAlign: TextAlign.start,
                    style: defaultTextStyle(
                      color: colorScheme.primary,
                      fontSize: 10.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              kHalfSizedBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.location5,
                    color: kStarColor,
                    size: 14,
                  ),
                  SizedBox(
                    width: media.width - 200,
                    child: Text(
                      propertyLocation ?? "",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: defaultTextStyle(
                        color: colorScheme.primary,
                        fontSize: 10.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              kSizedBox,
              SizedBox(
                width: media.width - 200,
                child: Text.rich(
                  TextSpan(
                    text: "NGN ",
                    style: defaultTextStyle(
                      fontSize: 16.0,
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w800,
                    ),
                    children: [
                      TextSpan(
                        text: propertyPrice ?? "",
                        style: defaultTextStyle(
                          fontSize: 16.0,
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextSpan(
                        text: propertyPaymentFreq ?? "b",
                        style: defaultTextStyle(
                          fontSize: 10.0,
                          color: colorScheme.primary,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
