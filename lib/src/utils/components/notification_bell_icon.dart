import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';
import '../../routes/routes.dart';

notificationBellIcon(ColorScheme colorScheme, controller) {
  return Container(
    margin: const EdgeInsets.all(10),
    decoration: ShapeDecoration(
      shape: CircleBorder(
        side: BorderSide(
          color: colorScheme.primary.withOpacity(.2),
        ),
      ),
    ),
    child: IconButton(
      onPressed: () {
        Get.toNamed(Routes.notificationsScreen, preventDuplicates: true);
      },
      icon: Stack(
        children: [
          SvgPicture.asset(
            Assets.notificationBellOutlineSvg,
            color: colorScheme.primary.withOpacity(.5),
            height: 20,
            width: 20,
            fit: BoxFit.cover,
          ),
          controller.hasNotifications.value == false
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
  );
}
