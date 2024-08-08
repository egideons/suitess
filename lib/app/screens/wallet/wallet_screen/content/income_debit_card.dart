import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';
import '../../../../../theme/colors.dart';

incomeDebitCard(
  Size media,
  ColorScheme colorScheme, {
  int? income,
  int? debit,
}) {
  return Stack(
    children: [
      Container(
        decoration: ShapeDecoration(
          color: const Color(0x3635371A).withOpacity(.05),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              bottomLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(2),
            ),
            side: BorderSide(
              width: .5,
              color: colorScheme.inversePrimary.withOpacity(.5),
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Assets.arrowDownSvg,
                  color: kAccentColor,
                ),
                kSmallWidthSizedBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Income",
                      style: defaultTextStyle(
                        color: kAccentColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: media.width / 4,
                      child: Text.rich(
                        TextSpan(
                          text: "$nairaSign ",
                          style: defaultTextStyle(
                            fontFamily: "",
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: intFormattedText(income ?? 0),
                              style: defaultTextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            kHalfWidthSizedBox,
            Container(
              height: 36,
              width: 1,
              color: colorScheme.inversePrimary.withOpacity(.4),
            ),
            kHalfWidthSizedBox,
            Row(
              children: [
                SvgPicture.asset(
                  Assets.arrowUpSvg,
                  color: kDebitColor,
                ),
                kHalfWidthSizedBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Debit",
                      style: defaultTextStyle(
                        color: kDebitColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: media.width / 4.4,
                      child: Text.rich(
                        TextSpan(
                          text: "$nairaSign ",
                          style: defaultTextStyle(
                            fontFamily: "",
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: intFormattedText(debit ?? 0),
                              style: defaultTextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      Positioned(
        top: 0,
        left: 0,
        child: SvgPicture.asset(Assets.incomeEllipseSvg),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: SvgPicture.asset(Assets.debitEllipseSvg),
      ),
    ],
  );
}
