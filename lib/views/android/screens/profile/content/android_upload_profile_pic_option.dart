import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants/consts.dart';
import '../../../../../theme/colors.dart';

androidUploadProfilePicOption(
  ColorScheme colorScheme, {
  void Function()? onTap,
  String? icon,
  String? label,
}) {
  return Column(
    children: [
      InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(100),
        child: Container(
          height: 60,
          width: 60,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: BorderSide(
                width: 0.5,
                color: colorScheme.inversePrimary,
              ),
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              icon ?? "",
              color: colorScheme.secondary,
            ),
          ),
        ),
      ),
      kHalfSizedBox,
      Text(
        label ?? "",
        style: defaultTextStyle(
          color: kTextBoldHeadingColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
