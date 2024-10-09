import 'package:flutter/material.dart';

import '../../../../../../../constants/consts.dart';
import '../../../../../../../theme/colors.dart';

emailSection(ColorScheme colorScheme, {String? userEmail}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: defaultTextStyle(
            color: colorScheme.inversePrimary,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
        kHalfSizedBox,
        Text(
          userEmail ?? "",
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: defaultTextStyle(
            color: kTextBoldHeadingColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
