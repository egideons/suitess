import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../theme/colors.dart';

quickActionCard(
  ColorScheme colorScheme,
  void Function()? onTap, {
  String? svgIcon,
  String? title,
}) {
  return InkWell(
    onTap: onTap ?? () {},
    borderRadius: BorderRadius.circular(12),
    child: Container(
      width: 76,
      height: 80,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            width: .4,
            color: colorScheme.inversePrimary.withOpacity(.2),
          ),
        ),
        shadows: [
          BoxShadow(
            blurRadius: 7,
            spreadRadius: 0,
            color: colorScheme.inversePrimary.withOpacity(.2),
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgIcon ?? "",
            color: kAccentColor,
          ),
          kHalfSizedBox,
          Text(
            title ?? "",
            textAlign: TextAlign.center,
            style: defaultTextStyle(
              color: kTextBoldHeadingColor,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
