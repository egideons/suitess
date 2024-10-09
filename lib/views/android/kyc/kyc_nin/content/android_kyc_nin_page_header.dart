import 'package:flutter/material.dart';

import '../../../../../constants/consts.dart';

Widget kycNinPageHeader(
    {ColorScheme? colorScheme, Size? media, String? title, String? subtitle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.center,
        child: Text(
          title ?? "",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: defaultTextStyle(
            fontSize: 24.0,
            color: colorScheme!.primary,
            letterSpacing: .90,
          ),
        ),
      ),
      kSizedBox,
      SizedBox(
        width: media!.width - 50,
        child: Text(
          subtitle ?? "",
          textAlign: TextAlign.center,
          maxLines: 2,
          style: defaultTextStyle(
            color: colorScheme.inversePrimary,
            fontSize: 14.0,
          ),
        ),
      ),
    ],
  );
}
