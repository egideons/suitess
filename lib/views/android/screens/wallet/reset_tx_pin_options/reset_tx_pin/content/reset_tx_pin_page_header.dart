import 'package:flutter/material.dart';
import 'package:suitess/src/constants/consts.dart';

resetTxPinPageHeader(ColorScheme colorScheme, Size media) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.center,
        child: Text(
          "Set New Pin",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: defaultTextStyle(
            fontSize: 24.0,
            color: colorScheme.primary,
          ),
        ),
      ),
      kSizedBox,
      SizedBox(
        width: media.width - 40,
        child: Text(
          "Your new pin must be different from the previously used pin.",
          maxLines: 10,
          textAlign: TextAlign.center,
          style: defaultTextStyle(
            color: colorScheme.primary,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ],
  );
}
