import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../theme/colors.dart';

editDetail(ColorScheme colorScheme,
    {String? title, String? detail, Function()? editFunction}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: defaultTextStyle(
            color: colorScheme.inversePrimary,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                detail ?? "",
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: defaultTextStyle(
                  color: kTextBoldHeadingColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: editFunction ?? () {},
              label: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Edit",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: defaultTextStyle(
                      color: kAccentColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  kHalfWidthSizedBox,
                  Icon(
                    Iconsax.edit,
                    color: kAccentColor,
                    size: 14,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
