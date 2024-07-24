import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';

import '../../../../../../../src/constants/consts.dart';
import '../../../../../../../src/controllers/app/notifications_settings_controller.dart';
import '../../../../../../../theme/colors.dart';

class NotificationsSettingsScaffold
    extends GetView<NotificationsSettingsController> {
  const NotificationsSettingsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(colorScheme, media, title: "Notifications Settings"),
      body: SafeArea(
        child: Scrollbar(
          controller: controller.scrollController,
          child: GetBuilder<NotificationsSettingsController>(
            init: NotificationsSettingsController(),
            builder: (controller) {
              return ListView(
                controller: controller.scrollController,
                padding: const EdgeInsets.all(10),
                physics: const BouncingScrollPhysics(),
                children: [
                  Text(
                    "Common",
                    textAlign: TextAlign.start,
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  kHalfSizedBox,
                  Container(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 10,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "General Notification",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: defaultTextStyle(
                                  color: kTextGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Obx(
                                () => Switch(
                                  value: controller.enableGeneralNotif.value,
                                  onChanged: (value) {
                                    controller.enableGeneralNotif.value = value;
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: kAccentColor,
                                  thumbColor: WidgetStatePropertyAll(
                                    controller.enableGeneralNotif.value
                                        ? kLightBackgroundColor
                                        : colorScheme.inversePrimary
                                            .withOpacity(.6),
                                  ),
                                  activeTrackColor: kAccentColor,
                                  inactiveTrackColor: colorScheme.inversePrimary
                                      .withOpacity(.2),
                                  trackOutlineColor: WidgetStatePropertyAll(
                                    colorScheme.inversePrimary.withOpacity(.2),
                                  ),
                                  trackOutlineWidth:
                                      const WidgetStatePropertyAll(.4),
                                  mouseCursor: SystemMouseCursors.click,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 10,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sound",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: defaultTextStyle(
                                  color: kTextGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Obx(
                                () => Switch(
                                  value: controller.enableSound.value,
                                  onChanged: (value) {
                                    controller.enableSound.value = value;
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: kAccentColor,
                                  thumbColor: WidgetStatePropertyAll(
                                    controller.enableSound.value
                                        ? kLightBackgroundColor
                                        : colorScheme.inversePrimary
                                            .withOpacity(.6),
                                  ),
                                  activeTrackColor: kAccentColor,
                                  inactiveTrackColor: colorScheme.inversePrimary
                                      .withOpacity(.2),
                                  trackOutlineColor: WidgetStatePropertyAll(
                                    colorScheme.inversePrimary.withOpacity(.2),
                                  ),
                                  trackOutlineWidth:
                                      const WidgetStatePropertyAll(.4),
                                  mouseCursor: SystemMouseCursors.click,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 10,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Vibrate",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: defaultTextStyle(
                                  color: kTextGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Obx(
                                () => Switch(
                                  value: controller.enableVibrate.value,
                                  onChanged: (value) {
                                    controller.enableVibrate.value = value;
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: kAccentColor,
                                  thumbColor: WidgetStatePropertyAll(
                                    controller.enableVibrate.value
                                        ? kLightBackgroundColor
                                        : colorScheme.inversePrimary
                                            .withOpacity(.6),
                                  ),
                                  activeTrackColor: kAccentColor,
                                  inactiveTrackColor: colorScheme.inversePrimary
                                      .withOpacity(.2),
                                  trackOutlineColor: WidgetStatePropertyAll(
                                    colorScheme.inversePrimary.withOpacity(.2),
                                  ),
                                  trackOutlineWidth:
                                      const WidgetStatePropertyAll(.4),
                                  mouseCursor: SystemMouseCursors.click,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 10,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "New house listing",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: defaultTextStyle(
                                  color: kTextGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Obx(
                                () => Switch(
                                  value: controller
                                      .enableNewHouseListingNotif.value,
                                  onChanged: (value) {
                                    controller.enableNewHouseListingNotif
                                        .value = value;
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: kAccentColor,
                                  thumbColor: WidgetStatePropertyAll(
                                    controller.enableNewHouseListingNotif.value
                                        ? kLightBackgroundColor
                                        : colorScheme.inversePrimary
                                            .withOpacity(.6),
                                  ),
                                  activeTrackColor: kAccentColor,
                                  inactiveTrackColor: colorScheme.inversePrimary
                                      .withOpacity(.2),
                                  trackOutlineColor: WidgetStatePropertyAll(
                                    colorScheme.inversePrimary.withOpacity(.2),
                                  ),
                                  trackOutlineWidth:
                                      const WidgetStatePropertyAll(.4),
                                  mouseCursor: SystemMouseCursors.click,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 10,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nearby houses",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: defaultTextStyle(
                                  color: kTextGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Obx(
                                () => Switch(
                                  value:
                                      controller.enableNearbyHousesNotif.value,
                                  onChanged: (value) {
                                    controller.enableNearbyHousesNotif.value =
                                        value;
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: kAccentColor,
                                  thumbColor: WidgetStatePropertyAll(
                                    controller.enableNearbyHousesNotif.value
                                        ? kLightBackgroundColor
                                        : colorScheme.inversePrimary
                                            .withOpacity(.6),
                                  ),
                                  activeTrackColor: kAccentColor,
                                  inactiveTrackColor: colorScheme.inversePrimary
                                      .withOpacity(.2),
                                  trackOutlineColor: WidgetStatePropertyAll(
                                    colorScheme.inversePrimary.withOpacity(.2),
                                  ),
                                  trackOutlineWidth:
                                      const WidgetStatePropertyAll(.4),
                                  mouseCursor: SystemMouseCursors.click,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  kSizedBox,
                  kSizedBox,
                  Text(
                    "System & services update",
                    textAlign: TextAlign.start,
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  kHalfSizedBox,
                  Container(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 10,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "App updates",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: defaultTextStyle(
                                  color: kTextGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Obx(
                                () => Switch(
                                  value: controller.enableAppUpdatesNotif.value,
                                  onChanged: (value) {
                                    controller.enableAppUpdatesNotif.value =
                                        value;
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: kAccentColor,
                                  thumbColor: WidgetStatePropertyAll(
                                    controller.enableAppUpdatesNotif.value
                                        ? kLightBackgroundColor
                                        : colorScheme.inversePrimary
                                            .withOpacity(.6),
                                  ),
                                  activeTrackColor: kAccentColor,
                                  inactiveTrackColor: colorScheme.inversePrimary
                                      .withOpacity(.2),
                                  trackOutlineColor: WidgetStatePropertyAll(
                                    colorScheme.inversePrimary.withOpacity(.2),
                                  ),
                                  trackOutlineWidth:
                                      const WidgetStatePropertyAll(.4),
                                  mouseCursor: SystemMouseCursors.click,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 10,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bill Reminder",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: defaultTextStyle(
                                  color: kTextGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Obx(
                                () => Switch(
                                  value:
                                      controller.enableBillReminderNotif.value,
                                  onChanged: (value) {
                                    controller.enableBillReminderNotif.value =
                                        value;
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: kAccentColor,
                                  thumbColor: WidgetStatePropertyAll(
                                    controller.enableBillReminderNotif.value
                                        ? kLightBackgroundColor
                                        : colorScheme.inversePrimary
                                            .withOpacity(.6),
                                  ),
                                  activeTrackColor: kAccentColor,
                                  inactiveTrackColor: colorScheme.inversePrimary
                                      .withOpacity(.2),
                                  trackOutlineColor: WidgetStatePropertyAll(
                                    colorScheme.inversePrimary.withOpacity(.2),
                                  ),
                                  trackOutlineWidth:
                                      const WidgetStatePropertyAll(.4),
                                  mouseCursor: SystemMouseCursors.click,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 10,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Promotion",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: defaultTextStyle(
                                  color: kTextGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Obx(
                                () => Switch(
                                  value: controller.enablePromotionNotif.value,
                                  onChanged: (value) {
                                    controller.enablePromotionNotif.value =
                                        value;
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: kAccentColor,
                                  thumbColor: WidgetStatePropertyAll(
                                    controller.enablePromotionNotif.value
                                        ? kLightBackgroundColor
                                        : colorScheme.inversePrimary
                                            .withOpacity(.6),
                                  ),
                                  activeTrackColor: kAccentColor,
                                  inactiveTrackColor: colorScheme.inversePrimary
                                      .withOpacity(.2),
                                  trackOutlineColor: WidgetStatePropertyAll(
                                    colorScheme.inversePrimary.withOpacity(.2),
                                  ),
                                  trackOutlineWidth:
                                      const WidgetStatePropertyAll(.4),
                                  mouseCursor: SystemMouseCursors.click,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 10,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Discount Available",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: defaultTextStyle(
                                  color: kTextGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Obx(
                                () => Switch(
                                  value: controller
                                      .enableDiscountAvailableNotif.value,
                                  onChanged: (value) {
                                    controller.enableDiscountAvailableNotif
                                        .value = value;
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: kAccentColor,
                                  thumbColor: WidgetStatePropertyAll(
                                    controller
                                            .enableDiscountAvailableNotif.value
                                        ? kLightBackgroundColor
                                        : colorScheme.inversePrimary
                                            .withOpacity(.6),
                                  ),
                                  activeTrackColor: kAccentColor,
                                  inactiveTrackColor: colorScheme.inversePrimary
                                      .withOpacity(.2),
                                  trackOutlineColor: WidgetStatePropertyAll(
                                    colorScheme.inversePrimary.withOpacity(.2),
                                  ),
                                  trackOutlineWidth:
                                      const WidgetStatePropertyAll(.4),
                                  mouseCursor: SystemMouseCursors.click,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  kSizedBox,
                  kSizedBox,
                  Text(
                    "Others",
                    textAlign: TextAlign.start,
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  kHalfSizedBox,
                  Container(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 10,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "New service available",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: defaultTextStyle(
                                  color: kTextGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Obx(
                                () => Switch(
                                  value: controller
                                      .enableNewServiceAvailableNotif.value,
                                  onChanged: (value) {
                                    controller.enableNewServiceAvailableNotif
                                        .value = value;
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: kAccentColor,
                                  thumbColor: WidgetStatePropertyAll(
                                    controller.enableNewServiceAvailableNotif
                                            .value
                                        ? kLightBackgroundColor
                                        : colorScheme.inversePrimary
                                            .withOpacity(.6),
                                  ),
                                  activeTrackColor: kAccentColor,
                                  inactiveTrackColor: colorScheme.inversePrimary
                                      .withOpacity(.2),
                                  trackOutlineColor: WidgetStatePropertyAll(
                                    colorScheme.inversePrimary.withOpacity(.2),
                                  ),
                                  trackOutlineWidth:
                                      const WidgetStatePropertyAll(.4),
                                  mouseCursor: SystemMouseCursors.click,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 10,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bill Reminder",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: defaultTextStyle(
                                  color: kTextGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Obx(
                                () => Switch(
                                  value:
                                      controller.enableBillReminderNotif.value,
                                  onChanged: (value) {
                                    controller.enableBillReminderNotif.value =
                                        value;
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: kAccentColor,
                                  thumbColor: WidgetStatePropertyAll(
                                    controller.enableBillReminderNotif.value
                                        ? kLightBackgroundColor
                                        : colorScheme.inversePrimary
                                            .withOpacity(.6),
                                  ),
                                  activeTrackColor: kAccentColor,
                                  inactiveTrackColor: colorScheme.inversePrimary
                                      .withOpacity(.2),
                                  trackOutlineColor: WidgetStatePropertyAll(
                                    colorScheme.inversePrimary.withOpacity(.2),
                                  ),
                                  trackOutlineWidth:
                                      const WidgetStatePropertyAll(.4),
                                  mouseCursor: SystemMouseCursors.click,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 10,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Promotion",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: defaultTextStyle(
                                  color: kTextGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Obx(
                                () => Switch(
                                  value: controller.enablePromotionNotif.value,
                                  onChanged: (value) {
                                    controller.enablePromotionNotif.value =
                                        value;
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: kAccentColor,
                                  thumbColor: WidgetStatePropertyAll(
                                    controller.enablePromotionNotif.value
                                        ? kLightBackgroundColor
                                        : colorScheme.inversePrimary
                                            .withOpacity(.6),
                                  ),
                                  activeTrackColor: kAccentColor,
                                  inactiveTrackColor: colorScheme.inversePrimary
                                      .withOpacity(.2),
                                  trackOutlineColor: WidgetStatePropertyAll(
                                    colorScheme.inversePrimary.withOpacity(.2),
                                  ),
                                  trackOutlineWidth:
                                      const WidgetStatePropertyAll(.4),
                                  mouseCursor: SystemMouseCursors.click,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: colorScheme.inversePrimary.withOpacity(.4),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 10,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Discount Available",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: defaultTextStyle(
                                  color: kTextGreyColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Obx(
                                () => Switch(
                                  value: controller
                                      .enableDiscountAvailableNotif.value,
                                  onChanged: (value) {
                                    controller.enableDiscountAvailableNotif
                                        .value = value;
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: kAccentColor,
                                  thumbColor: WidgetStatePropertyAll(
                                    controller
                                            .enableDiscountAvailableNotif.value
                                        ? kLightBackgroundColor
                                        : colorScheme.inversePrimary
                                            .withOpacity(.6),
                                  ),
                                  activeTrackColor: kAccentColor,
                                  inactiveTrackColor: colorScheme.inversePrimary
                                      .withOpacity(.2),
                                  trackOutlineColor: WidgetStatePropertyAll(
                                    colorScheme.inversePrimary.withOpacity(.2),
                                  ),
                                  trackOutlineWidth:
                                      const WidgetStatePropertyAll(.4),
                                  mouseCursor: SystemMouseCursors.click,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
