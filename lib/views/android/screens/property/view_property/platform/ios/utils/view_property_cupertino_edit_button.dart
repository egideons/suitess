import 'package:flutter/cupertino.dart';

import '../../../../../../../../constants/consts.dart';
import '../../../../../../../../theme/colors.dart';

Widget viewPropertyEditCupertinoButton(
  colorScheme,
  media, {
  priceOfProperty,
  paymentFrequency,
  editProperty,
}) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    decoration: ShapeDecoration(
      color: colorScheme.inversePrimary.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            text: "NGN ${formatIntNumber(priceOfProperty ?? 0)}",
            style: defaultTextStyle(
              color: colorScheme.primary,
              fontSize: 24,
            ),
            children: [
              TextSpan(
                text: "/$paymentFrequency",
                style: defaultTextStyle(
                  color: kGreyColor,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
        CupertinoButton(
          onPressed: editProperty ?? () {},
          padding: const EdgeInsets.all(20),
          color: colorScheme.secondary,
          borderRadius: BorderRadius.circular(24),
          child: SizedBox(
            width: media.width / 3,
            height: 30,
            child: Center(
              child: Text(
                "Edit",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: defaultTextStyle(
                  fontSize: 16,
                  color: kTextWhiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
