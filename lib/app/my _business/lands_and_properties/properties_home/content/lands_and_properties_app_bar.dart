import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suitess/src/controllers/app/lands_and_properties_controller.dart';
import 'package:suitess/src/utils/components/responsive_constants.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/utils/components/notification_bell_icon.dart';

landsAndPropertiesAppBar(
  ColorScheme colorScheme,
  Size media,
  String location,
  LandsAndPropertiesController controller, {
  Function()? toLocation,
}) {
  return AppBar(
    backgroundColor: colorScheme.surface,
    automaticallyImplyLeading: false,
    leadingWidth: 0,
    elevation: 0,
    scrolledUnderElevation: 0,
    leading: const SizedBox(),
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
      //           color: kWhiteBackgroundColor,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      // kHalfWidthSizedBox,
      notificationBellIcon(colorScheme, controller)
    ],
  );
}
