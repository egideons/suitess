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
  Function()? goToNotifications,
  bool? hasNotifications,
}) {
  return AppBar(
    backgroundColor: colorScheme.surface,
    automaticallyImplyLeading: true,
    title: InkWell(
      onTap: toLocation ?? () {},
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width:
            deviceType(media.width) > 1 ? media.width / 4.2 : media.width / 2.2,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(
              color: colorScheme.primary.withOpacity(.2),
            ),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              height: 20,
              width: 20,
              Assets.locationPinFilledIconSvg,
              color: colorScheme.primary.withOpacity(.5),
              fit: BoxFit.contain,
            ),
            kHalfWidthSizedBox,
            Text(
              location,
              overflow: TextOverflow.ellipsis,
              style: defaultTextStyle(
                fontSize: 10.0,
                color: colorScheme.primary,
                fontWeight: FontWeight.normal,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: colorScheme.primary.withOpacity(.5),
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
        margin: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          shape: CircleBorder(
            side: BorderSide(
              color: colorScheme.primary.withOpacity(.2),
            ),
          ),
        ),
        child: IconButton(
          onPressed: goToNotifications ?? () {},
          icon: Stack(
            children: [
              SvgPicture.asset(
                Assets.notificationBellOutlineSvg,
                color: colorScheme.primary.withOpacity(.5),
                height: 20,
                width: 20,
                fit: BoxFit.cover,
              ),
              hasNotifications == false
                  ? const SizedBox()
                  : Positioned(
                      right: 0,
                      child: SvgPicture.asset(
                        height: 10,
                        Assets.redDotFilledSvg,
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
