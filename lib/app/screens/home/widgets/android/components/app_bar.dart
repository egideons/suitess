import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suitess/src/utils/components/responsive_constants.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../src/constants/consts.dart';

homeAppBar(
  ColorScheme colorScheme,
  Size media,
  String location, {
  Function()? toLocation,
  Function()? toNotifications,
  bool? hasNotifications,
}) {
  return AppBar(
    backgroundColor: colorScheme.surface,
    automaticallyImplyLeading: true,
    title: InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width:
            deviceType(media.width) > 1 ? media.width / 4.2 : media.width / 2.2,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(
              color: colorScheme.inversePrimary.withOpacity(.2),
            ),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              Assets.locationPinFilledIconSvg,
              fit: BoxFit.contain,
            ),
            kHalfWidthSizedBox,
            Text(
              location ?? "",
              overflow: TextOverflow.ellipsis,
              style: defaultTextStyle(
                fontSize: 10.0,
                color: colorScheme.primary,
                fontWeight: FontWeight.normal,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: colorScheme.inversePrimary,
            ),
          ],
        ),
      ),
    ),
    actions: [
      // SizedBox(
      //   height: 40,
      //   child: FittedBox(
      //     fit: BoxFit.contain,
      //     child: CircleAvatar(
      //       backgroundColor: colorScheme.inversePrimary,
      //       radius: 64,
      //       foregroundImage:
      //           const NetworkImage(Assets.userPlaceholderImage),
      //       child: Text(
      //         "P",
      //         style: defaultTextStyle(
      //           fontSize: 32.0,
      //           color: kLightBackgroundColor,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      // kHalfWidthSizedBox,
      Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: ShapeDecoration(
          shape: CircleBorder(
            side: BorderSide(
              color: colorScheme.inversePrimary.withOpacity(.2),
            ),
          ),
        ),
        child: IconButton(
          onPressed: toNotifications ?? () {},
          icon: Stack(
            children: [
              SvgPicture.asset(
                Assets.notificationBellOutlineSvg,
                fit: BoxFit.contain,
              ),
              hasNotifications == false
                  ? const SizedBox()
                  : Positioned(
                      right: 3,
                      child: SvgPicture.asset(
                        height: 10,
                        Assets.redDotFilled,
                        fit: BoxFit.contain,
                      ),
                    ),
            ],
          ),
        ),
      )
    ],
  );
}
