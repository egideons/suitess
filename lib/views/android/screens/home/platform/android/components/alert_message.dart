import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../src/constants/consts.dart';
import '../../../../../../../theme/colors.dart';

messageAlertAndroid(media, {onPressed, message}) {
  return InkWell(
    onTap: onPressed ?? () {},
    // padding: const EdgeInsets.all(0),
    borderRadius: BorderRadius.circular(16),
    child: Container(
      width: media.width,
      height: media.height * .066,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: ShapeDecoration(
        color: kRedCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            message ?? "",
            style: defaultTextStyle(
              color: kErrorColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(Iconsax.arrow_right_3, color: kErrorColor),
        ],
      ),
    ),
  );
}
