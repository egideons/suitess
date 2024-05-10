import 'package:flutter/cupertino.dart';

import '../../../../../../../../src/constants/consts.dart';
import '../../../../../../../../theme/colors.dart';

Widget viewPropertyCupertinoShowNewBidsAlert(
  colorScheme,
  media, {
  numberOfBids,
  viewDetailsOfNewBids,
}) {
  return Container(
    width: media.width,
    height: media.height * .09,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    decoration: ShapeDecoration(
      color: kGreenCardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      shadows: [
        BoxShadow(
          color: kGreenCardColor.withOpacity(0.2),
          offset: const Offset(4, 10),
          blurRadius: 10,
          spreadRadius: 4,
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have",
              textAlign: TextAlign.start,
              style: defaultTextStyle(
                fontSize: 12,
                color: kTextWhiteColor,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              width: media.width - 150,
              child: Text(
                "$numberOfBids new bids",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: defaultTextStyle(
                  fontSize: 16,
                  color: kTextWhiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        Container(
          color: kLightGreyColor,
          height: 40,
          width: 2,
        ),
        CupertinoButton(
          onPressed: viewDetailsOfNewBids ?? () {},
          padding: const EdgeInsets.all(0),
          borderRadius: BorderRadius.circular(50),
          child: Text(
            "View\ndetails",
            textAlign: TextAlign.start,
            style: defaultTextStyle(
              fontSize: 14,
              color: kTextWhiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}
