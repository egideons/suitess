import 'package:flutter/material.dart';

import '../../../../../../../constants/consts.dart';
import '../../../../../../../theme/colors.dart';

propertyGallery(ColorScheme colorScheme, {Function()? viewAll}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Text(
          "Gallery",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: defaultTextStyle(
            color: kTextBoldHeadingColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      InkWell(
        onTap: viewAll ?? () {},
        borderRadius: BorderRadius.circular(24),
        enableFeedback: true,
        mouseCursor: SystemMouseCursors.cell,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            "View all",
            style: defaultTextStyle(
              color: colorScheme.secondary,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      )
    ],
  );
}
