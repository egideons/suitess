import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../src/constants/consts.dart';
import '../../../../../../../theme/colors.dart';

Widget addPropertyCupertinoButton({onPressed}) {
  return CupertinoButton(
    onPressed: onPressed ?? () {},
    padding: const EdgeInsets.all(0),
    borderRadius: BorderRadius.circular(16),
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: kAccentColor.withOpacity(.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Iconsax.add,
            color: kAccentColor,
          ),
          Text(
            "Add property",
            style: defaultTextStyle(
              color: kAccentColor,
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    ),
  );
}
