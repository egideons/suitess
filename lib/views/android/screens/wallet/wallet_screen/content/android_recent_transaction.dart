import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../constants/assets.dart';
import '../../../../../../constants/consts.dart';
import '../../../../../../theme/colors.dart';

androidRecentTransaction(
  Size media,
  ColorScheme colorScheme,
  void Function()? onTap, {
  String? title,
  DateTime? dateTime,
  int? amount,
  bool? isIncome,
  bool? isSuccessful,
  bool? isCancelled,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: onTap ?? () {},
      borderRadius: BorderRadius.circular(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kFrameColor,
                  ),
                  child: SvgPicture.asset(
                    isIncome == true ? Assets.arrowDownSvg : Assets.arrowUpSvg,
                    color: colorScheme.secondary,
                  ),
                ),
                kSmallWidthSizedBox,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: media.width - 250,
                        child: Text(
                          title ?? "",
                          textAlign: TextAlign.start,
                          style: defaultTextStyle(
                            color: kTextBoldHeadingColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        formatDate(dateTime ?? DateTime.now()),
                        textAlign: TextAlign.start,
                        style: defaultTextStyle(
                          color: kTextGreyColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text.rich(
                  TextSpan(
                    text: "$nairaSign ",
                    style: defaultTextStyle(
                      fontFamily: "",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        text: intFormattedText(amount ?? 0),
                        style: defaultTextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  isSuccessful == true
                      ? "Successful"
                      : isCancelled == true
                          ? "Cancelled"
                          : "Pending",
                  textAlign: TextAlign.end,
                  style: defaultTextStyle(
                    color: isSuccessful == true
                        ? colorScheme.secondary
                        : isCancelled == true
                            ? kErrorColor
                            : kPendingColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
