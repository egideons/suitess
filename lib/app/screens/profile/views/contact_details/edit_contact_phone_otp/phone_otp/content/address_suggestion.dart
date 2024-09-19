import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suitess/src/constants/consts.dart';

import '../../../../../../../../src/controllers/app/contact_details_controller.dart';

addressSuggestion(
  Size media,
  ColorScheme colorScheme,
  ContactDetailsScreenController controller,
) {
  return InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(8),
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(width: .4, color: colorScheme.secondary),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Iconsax.location,
            color: colorScheme.secondary,
            size: 32,
          ),
          kSmallWidthSizedBox,
        ],
      ),
    ),
  );
}
