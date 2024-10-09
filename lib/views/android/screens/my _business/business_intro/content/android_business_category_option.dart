import 'package:flutter/material.dart';

import '../../../../../../constants/assets.dart';
import '../../../../../../constants/consts.dart';
import '../../../../../../theme/colors.dart';

androidBusinessCategoryOption(
  ColorScheme colorScheme, {
  void Function()? onTap,
  String? image,
  String? title,
  String? subtitle,
}) {
  return InkWell(
    onTap: onTap ?? () {},
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
          Image.asset(image ?? Assets.landsAndPropertiesPng),
          kSmallWidthSizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title ?? "",
                  textAlign: TextAlign.start,
                  style: defaultTextStyle(
                    color: kTextBoldHeadingColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                kSmallSizedBox,
                Text(
                  subtitle ?? "",
                  textAlign: TextAlign.start,
                  maxLines: 10,
                  style: defaultTextStyle(
                    color: kTextBoldHeadingColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
