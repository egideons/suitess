import 'package:flutter/material.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../theme/colors.dart';

accountTypeField(
  ColorScheme colorScheme, {
  String? accountyType,
  String? changeAccountType,
  bool? isVisible = true,
  Function()? changeAccountTypeFunc,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Account type",
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        style: defaultTextStyle(
          color: colorScheme.inversePrimary,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
      kHalfSizedBox,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              accountyType ?? "Regular user",
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: defaultTextStyle(
                color: kTextBoldHeadingColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          isVisible == true
              ? InkWell(
                  onTap: changeAccountTypeFunc ?? () {},
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: ShapeDecoration(
                      color: kBannerBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        changeAccountType ?? "",
                        textAlign: TextAlign.center,
                        style: defaultTextStyle(
                          fontSize: 10,
                          color: kBannerTextColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    ],
  );
}
