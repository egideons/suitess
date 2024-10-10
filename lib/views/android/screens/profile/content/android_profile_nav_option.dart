import 'package:flutter/material.dart';

import '../../../../../constants/consts.dart';

androidProfileNavOption(ColorScheme colorScheme,
    {String? title, Function()? nav}) {
  return InkWell(
    onTap: nav ?? () {},
    borderRadius: BorderRadius.circular(10),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? "",
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: defaultTextStyle(
              color: colorScheme.inversePrimary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: colorScheme.inversePrimary,
            size: 30,
          ),
        ],
      ),
    ),
  );
}
