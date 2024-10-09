import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controllers/app/notifications_settings_controller.dart';
import 'toggle_option.dart';

systemAndServiceSettings(
    ColorScheme colorScheme, NotificationsSettingsController controller) {
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
        Obx(
          () => toggleOption(
            controller,
            colorScheme,
            title: "App updates",
            value: controller.enableAppUpdatesNotif.value,
            onChanged: controller.toggleAppUpdates,
          ),
        ),
        Divider(
          color: colorScheme.inversePrimary.withOpacity(.4),
          height: 10,
        ),
        Obx(
          () => toggleOption(
            controller,
            colorScheme,
            title: "Bill Reminder",
            value: controller.enableBillReminderNotif.value,
            onChanged: controller.toggleBillReminder,
          ),
        ),
        Divider(
          color: colorScheme.inversePrimary.withOpacity(.4),
        ),
        Obx(
          () => toggleOption(
            controller,
            colorScheme,
            title: "Promotion",
            value: controller.enablePromotionNotif.value,
            onChanged: controller.togglePromotion,
          ),
        ),
        Divider(
          color: colorScheme.inversePrimary.withOpacity(.4),
        ),
        Obx(
          () => toggleOption(
            controller,
            colorScheme,
            title: "Discount Available",
            value: controller.enableDiscountAvailableNotif.value,
            onChanged: controller.toggleDiscountAvailable,
          ),
        ),
        Divider(
          color: colorScheme.inversePrimary.withOpacity(.4),
        ),
        Obx(
          () => toggleOption(
            controller,
            colorScheme,
            title: "New Service Available",
            value: controller.enableNewServiceAvailableNotif.value,
            onChanged: controller.toggleNewServiceAvailable,
          ),
        ),
        Divider(
          color: colorScheme.inversePrimary.withOpacity(.4),
        ),
        Obx(
          () => toggleOption(
            controller,
            colorScheme,
            title: "New Tips Available",
            value: controller.enableNewTipsAvailableNotif.value,
            onChanged: controller.toggleNewTipsAvailable,
          ),
        ),
      ],
    ),
  );
}
