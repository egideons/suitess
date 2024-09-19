import 'package:flutter/material.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../theme/colors.dart';

changePassword(
  ColorScheme colorScheme, {
  String? password,
  Function()? changePasswordFunc,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Password",
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        style: defaultTextStyle(
          color: colorScheme.inversePrimary,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
      kHalfSizedBox,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              password ?? "* * * * * * * * * * * * * * * * *",
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: defaultTextStyle(
                color: kTextBoldHeadingColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          InkWell(
            onTap: changePasswordFunc ?? () {},
            borderRadius: BorderRadius.circular(12),
            child: Text(
              "Change",
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: defaultTextStyle(
                color: colorScheme.secondary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
