import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../theme/colors.dart';

Widget homeScreenAddAPropertyCupertinoButton(colorScheme, {onPressed}) {
  return CupertinoButton(
    onPressed: onPressed ?? () {},
    padding: const EdgeInsets.all(0),
    borderRadius: BorderRadius.circular(24),
    pressedOpacity: .8,
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: ShapeDecoration(
        color: colorScheme.inversePrimary.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Iconsax.add_circle5,
            color: kGreyColor,
            size: 32,
          ),
          kHalfWidthSizedBox,
          Text(
            "Add a property",
            style: defaultTextStyle(
              color: kGreyColor,
            ),
          ),
        ],
      ),
    ),
  );
}
