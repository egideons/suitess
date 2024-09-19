import 'package:flutter/material.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../theme/colors.dart';

numberOfBids(
  Size media,
  ColorScheme colorScheme, {
  Function()? viewAll,
  int? noOfAgents,
}) {
  return InkWell(
    onTap: viewAll ?? () {},
    borderRadius: BorderRadius.circular(8),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: ShapeDecoration(
        color: colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: [
          BoxShadow(
            color: colorScheme.secondary.withOpacity(.4),
            offset: const Offset(0, -15),
            spreadRadius: -10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You have",
            textAlign: TextAlign.start,
            style: defaultTextStyle(
              color: kTextWhiteColor,
              fontWeight: FontWeight.w600,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                noOfAgents == 1
                    ? "${intFormattedText(noOfAgents ?? 0)} New bid"
                    : "${intFormattedText(noOfAgents ?? 0)} New bids",
                textAlign: TextAlign.start,
                style: defaultTextStyle(
                  color: kTextWhiteColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                ),
              ),
              InkWell(
                child: Text(
                  "View all",
                  textAlign: TextAlign.start,
                  style: defaultTextStyle(
                    color: kTextWhiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                    decoration: TextDecoration.underline,
                    decorationColor: kTextWhiteColor,
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
