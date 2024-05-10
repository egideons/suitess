import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../theme/colors.dart';

Widget viewPropertyDetailsSection(
  media, {
  numberOfBeds,
  numberOfBaths,
  sqm,
  propertyTag,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 10,
    ),
    decoration: ShapeDecoration(
      color: kAccentColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.single_bed_rounded,
              color: kAccentColor,
            ),
            kHalfSizedBox,
            SizedBox(
              width: media.width / 5,
              child: Text(
                "$numberOfBeds  Beds",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: defaultTextStyle(
                  color: kGreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.bathtub_rounded,
              color: kAccentColor,
            ),
            kHalfSizedBox,
            SizedBox(
              width: media.width / 4,
              child: Text(
                "$numberOfBaths Baths",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: defaultTextStyle(
                  color: kGreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Iconsax.home_15,
              color: kAccentColor,
            ),
            kHalfSizedBox,
            SizedBox(
              width: media.width / 4,
              child: Text(
                "${intFormattedText(sqm)}  Sqm",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: defaultTextStyle(
                  color: kGreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Iconsax.tag5,
              color: kAccentColor,
            ),
            kHalfSizedBox,
            SizedBox(
              width: media.width / 6,
              child: Text(
                propertyTag ?? "",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: defaultTextStyle(
                  color: kGreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
