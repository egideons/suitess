import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/theme/colors.dart';

import '../../../../../../src/controllers/app/contact_details_controller.dart';

addressSuggestion(
  Size media,
  ColorScheme colorScheme,
  ContactDetailsScreenController controller,
) {
  return InkWell(
    onTap: controller.selectAddressSuggestion,
    borderRadius: BorderRadius.circular(8),
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(width: .4, color: colorScheme.inversePrimary),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Iconsax.location5,
            color: colorScheme.secondary,
            size: 24,
          ),
          kSmallWidthSizedBox,
          Expanded(
            child: Text(
              "Enugu, Nigeria",
              style: defaultTextStyle(
                color: kTextBoldHeadingColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
