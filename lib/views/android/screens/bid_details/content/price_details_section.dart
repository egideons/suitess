import 'package:flutter/widgets.dart';

import '../../../../../constants/consts.dart';

Widget priceDetailsSection(
  media,
  colorScheme, {
  priceOfProperty,
  bidPrice,
  agentFee,
}) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: ShapeDecoration(
      color: colorScheme.inversePrimary.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Price",
              style: defaultTextStyle(
                color: colorScheme.inversePrimary,
                fontSize: 12,
              ),
            ),
            SizedBox(
              width: media.width / 2.6,
              child: Text(
                "NGN ${doubleFormattedText(priceOfProperty ?? 0)}",
                textAlign: TextAlign.end,
                style: defaultTextStyle(
                  color: colorScheme.primary,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        kSizedBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Bid",
              style: defaultTextStyle(
                color: colorScheme.inversePrimary,
                fontSize: 12,
              ),
            ),
            SizedBox(
              width: media.width / 2.6,
              child: Text(
                "NGN ${doubleFormattedText(bidPrice ?? 0)}",
                textAlign: TextAlign.end,
                style: defaultTextStyle(
                  color: colorScheme.primary,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        kSizedBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Agent Fee",
              style: defaultTextStyle(
                color: colorScheme.inversePrimary,
                fontSize: 12,
              ),
            ),
            SizedBox(
              width: media.width / 2.6,
              child: Text(
                "NGN ${doubleFormattedText(agentFee ?? 0)}",
                textAlign: TextAlign.end,
                style: defaultTextStyle(
                  color: colorScheme.primary,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
