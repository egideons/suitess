import 'package:flutter/material.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../theme/colors.dart';

propertyNameAndPrice({String? propertyName, int? propertyPrice}) {
  return Row(
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
            fontSize: 12,
          ),
          children: [
            TextSpan(
              text: intFormattedText(propertyPrice ?? 0),
              style: defaultTextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 12,
              ),
            ),
            // TextSpan(
            //   text: "month",
            //   style: defaultTextStyle(
            //     fontWeight: FontWeight.normal,
            //     fontSize: 10,
            //   ),
            // )
          ],
        ),
      ),
    ],
  );
}
