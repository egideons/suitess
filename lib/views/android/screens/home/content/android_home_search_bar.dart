import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants/assets.dart';
import '../../../../../constants/consts.dart';
import '../../../../../controllers/app/home_screen_controller.dart';
import '../../../../../theme/colors.dart';

androidHomeSearchBar(
  HomeScreenController controller,
  Size media,
  ColorScheme colorScheme,
) {
  return InkWell(
    onTap: controller.goToSearchScreen,
    borderRadius: BorderRadius.circular(8),
    child: Container(
      width: media.width,
      height: media.height * 0.06,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: ShapeDecoration(
        color: kTransparentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: colorScheme.primary,
            width: 0.2,
          ),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(Assets.searchOutlineSvg),
          kHalfWidthSizedBox,
          Text(
            "Search",
            style: defaultTextStyle(
              color: colorScheme.inversePrimary,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    ),
  );
}
