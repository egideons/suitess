import 'package:flutter/material.dart';

import '../../../../../../constants/consts.dart';
import '../../../../../../theme/colors.dart';

atmCardOption(
  ColorScheme colorScheme, {
  void Function()? selectOption,
  String? cardType,
  String? cardNumber,
  DateTime? expiryDate,
}) {
  return InkWell(
    onTap: selectOption ?? () {},
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
          Image.asset(cardType ?? "", height: 40, width: 60),
          kHalfWidthSizedBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maskCardNumber(cardNumber ?? "0000"),
                style: defaultTextStyle(
                  color: kTextBoldHeadingColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "Expires ",
                  style: defaultTextStyle(
                    color: kTextBoldHeadingColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: formatDayAndMonth(expiryDate ?? DateTime.now()),
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
        ],
      ),
    ),
  );
}
