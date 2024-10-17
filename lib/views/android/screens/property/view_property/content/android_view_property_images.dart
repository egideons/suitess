import 'package:flutter/material.dart';

import '../../../../../../constants/consts.dart';
import '../../../../../../controllers/app/view_property_controller.dart';

androidViewPropertyImages(
  Size media,
  ColorScheme colorScheme,
  ViewPropertyController controller,
) {
  return SizedBox(
    height: 120,
    child: ListView.separated(
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      separatorBuilder: (context, index) => kHalfWidthSizedBox,
      itemBuilder: (context, index) {
        return Container(
          width: media.width / 3,
          decoration: ShapeDecoration(
            color: colorScheme.inversePrimary.withOpacity(.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                controller.androidViewPropertyImages[index],
              ),
            ),
          ),
        );
      },
    ),
  );
}
