import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../src/constants/consts.dart';
import '../../../../theme/colors.dart';

ObstructingPreferredSizeWidget authCupertinoNavBar({
  colorScheme,
  media,
}) {
  return CupertinoNavigationBar(
    transitionBetweenRoutes: true,
    backgroundColor: colorScheme.background,
    border: Border.all(color: kTransparentColor),
    middle: Container(
      width: media.width - 250,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: Get.isDarkMode
            ? kSuccessColor.withOpacity(0.2)
            : kSuccessColor.withOpacity(0.06),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FaIcon(
              FontAwesomeIcons.key,
              color: kSuccessColor,
              size: 12,
            ),
            kHalfWidthSizedBox,
            Text(
              "Create account",
              style: defaultTextStyle(color: kSuccessColor),
            ),
          ],
        ),
      ),
    ),
  );
}
