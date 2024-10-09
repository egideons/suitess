import 'package:flutter/material.dart';

import '../../../../../../../constants/consts.dart';
import '../../../../../../../theme/colors.dart';

filterPropertiesNearby(
  Function()? goToFilterProperties,
  ColorScheme colorScheme, {
  bool? filterButtonIsVisible,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        child: Text(
          "Properties nearby",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: defaultTextStyle(
            color: kTextBoldHeadingColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      filterButtonIsVisible ?? false
          ? InkWell(
              onTap: goToFilterProperties ?? () {},
              borderRadius: BorderRadius.circular(24),
              enableFeedback: true,
              mouseCursor: SystemMouseCursors.cell,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  "Filter",
                  style: defaultTextStyle(
                    color: colorScheme.secondary,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          : const SizedBox(),
    ],
  );
}
