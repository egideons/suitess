import 'package:flutter/material.dart';

import '../../../../../../../constants/consts.dart';
import '../../../../../../../controllers/app/lands_and_properties_controller.dart';
import '../../../../../../../theme/colors.dart';

androidVerifyAccountContainer(
  LandsAndPropertiesController controller,
  ColorScheme colorScheme,
) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
    padding: const EdgeInsets.only(left: 10),
    decoration: ShapeDecoration(
      color: kGreenFrameBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: controller.verifyAccount,
          borderRadius: BorderRadius.circular(8),
          child: Text(
            "Verify account",
            style: defaultTextStyle(
              color: colorScheme.secondary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        IconButton(
          onPressed: controller.removeVerifyAccountBanner,
          icon: Icon(Icons.close, color: colorScheme.secondary),
        ),
      ],
    ),
  );
}
