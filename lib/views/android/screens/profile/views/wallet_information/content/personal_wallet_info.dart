import 'package:flutter/material.dart';

import '../../../../../../../constants/consts.dart';
import '../../../../../../../theme/colors.dart';

personalWalletInfo(Size media, ColorScheme colorScheme) {
  return Container(
    width: media.width,
    padding: const EdgeInsets.all(10),
    decoration: ShapeDecoration(
      color: kTransparentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: colorScheme.primary, width: 0.2),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Wallet Name",
              textAlign: TextAlign.start,
              style: defaultTextStyle(
                color: kTextBoldHeadingColor,
                fontSize: 8,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "Michael Acoi",
              textAlign: TextAlign.start,
              style: defaultTextStyle(
                color: kTextBoldHeadingColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        kSizedBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Wallet Number",
              textAlign: TextAlign.start,
              style: defaultTextStyle(
                color: kTextBoldHeadingColor,
                fontSize: 8,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "9308247520",
              textAlign: TextAlign.start,
              style: defaultTextStyle(
                color: kTextBoldHeadingColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        kSizedBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Phone Number",
              textAlign: TextAlign.start,
              style: defaultTextStyle(
                color: kTextBoldHeadingColor,
                fontSize: 8,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "07055111572",
              textAlign: TextAlign.start,
              style: defaultTextStyle(
                color: kTextBoldHeadingColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        kSizedBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Account Type",
              textAlign: TextAlign.start,
              style: defaultTextStyle(
                color: kTextBoldHeadingColor,
                fontSize: 8,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "Tier 1",
              textAlign: TextAlign.start,
              style: defaultTextStyle(
                color: kTextBoldHeadingColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
