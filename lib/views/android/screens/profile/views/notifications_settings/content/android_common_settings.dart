import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controllers/app/notifications_settings_controller.dart';
import 'android_toggle_option.dart';

androidCommonSettings(
  ColorScheme colorScheme,
  NotificationsSettingsController controller,
) {
  return Container(
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          width: 1,
          color: colorScheme.inversePrimary.withOpacity(.4),
        ),
      ),
    ),
    child: Column(
      children: [
        // kHalfSizedBox,
        Obx(
          () => androidToggleOption(
            controller,
            colorScheme,
            title: "General Notification",
            value: controller.enableGeneralNotif.value,
            onChanged: controller.toggleGeneralNotif,
          ),
        ),
        Divider(
          color: colorScheme.inversePrimary.withOpacity(.4),
          height: 10,
        ),
        Obx(
          () => androidToggleOption(
            controller,
            colorScheme,
            title: "Sound",
            value: controller.enableSound.value,
            onChanged: controller.toggleSound,
          ),
        ),
        Divider(
          color: colorScheme.inversePrimary.withOpacity(.4),
        ),
        Obx(
          () => androidToggleOption(
            controller,
            colorScheme,
            title: "Vibrate",
            value: controller.enableVibrate.value,
            onChanged: controller.toggleVibrate,
          ),
        ),
        Divider(
          color: colorScheme.inversePrimary.withOpacity(.4),
        ),
        Obx(
          () => androidToggleOption(
            controller,
            colorScheme,
            title: "New house listing",
            value: controller.enableNewHouseListingNotif.value,
            onChanged: controller.toggleNewHouseListing,
          ),
        ),
        Divider(
          color: colorScheme.inversePrimary.withOpacity(.4),
        ),
        Obx(
          () => androidToggleOption(
            controller,
            colorScheme,
            title: "Nearby houses",
            value: controller.enableNearbyHousesNotif.value,
            onChanged: controller.toggleNearbyHouses,
          ),
        ),
      ],
    ),
  );
}
