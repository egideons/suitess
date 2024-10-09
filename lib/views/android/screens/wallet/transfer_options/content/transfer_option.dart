import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../constants/consts.dart';
import '../../../../../../theme/colors.dart';

transferOption(
  ColorScheme colorScheme, {
  void Function()? selectOption,
  String? icon,
  String? title,
}) {
  return InkWell(
    onTap: selectOption ?? () {},
    borderRadius: BorderRadius.circular(10),
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            width: .5,
            color: colorScheme.inversePrimary.withOpacity(.4),
          ),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon ?? "",
            color: colorScheme.secondary,
          ),
          kHalfWidthSizedBox,
          Text(
            title ?? "",
            style: defaultTextStyle(
              color: kTextBoldHeadingColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
