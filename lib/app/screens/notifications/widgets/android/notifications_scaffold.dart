import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/app/notifications_controller.dart';
import '../../../../../theme/colors.dart';
import '../../content/notification_dismissible_widget.dart';

class NotificationsScaffold extends GetView<NotificationsController> {
  const NotificationsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = NotificationsController.instance;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: appBar(colorScheme, media),
      floatingActionButton: Obx(
        () => controller.isScrollToTopBtnVisible.value
            ? FloatingActionButton.small(
                onPressed: controller.scrollToTop,
                backgroundColor: kAccentColor,
                foregroundColor: kLightBackgroundColor,
                child: const Icon(Icons.keyboard_arrow_up),
              )
            : const SizedBox(),
      ),
      body: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: controller.onRefresh,
          backgroundColor: colorScheme.surface,
          color: colorScheme.primary,
          child: CupertinoScrollbar(
            controller: controller.scrollController,
            child: GetBuilder<NotificationsController>(
              init: NotificationsController(),
              builder: (controller) {
                return controller.hasNoNotifications.value
                    ? emptyNotifications(media, colorScheme)
                    : ListView.separated(
                        controller: controller.scrollController,
                        itemCount: 30,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(10),
                        separatorBuilder: (context, index) => kHalfSizedBox,
                        itemBuilder: (context, index) {
                          return notificationWidget(
                            colorScheme,
                            media,
                            notificationMessage:
                                "Appointment confirmed for 12:00pm, 20th Oct 2021 by Clinton Tia",
                            notificationTime: "Just now",
                            notificationColor: kSuccessColor,
                          );
                        },
                      );
              },
            ),
          ),
        ),
      ),
    );
  }

  emptyNotifications(
    Size media,
    ColorScheme colorScheme, {
    String? title,
    String? message,
  }) {
    return Container(
      height: media.height / 2,
      width: media.width,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.noNotificationsSvg,
            height: media.height / 4,
            fit: BoxFit.cover,
          ),
          kSizedBox,
          Text(
            title ?? "Oops",
            textAlign: TextAlign.center,
            style: defaultTextStyle(
              color: colorScheme.inversePrimary,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            message ??
                "You're all caught up! We'll notify you when there's something new.",
            maxLines: 4,
            textAlign: TextAlign.center,
            style: defaultTextStyle(
              color: colorScheme.inversePrimary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  appBar(ColorScheme colorScheme, Size media, {Function()? goToSettings}) {
    return AppBar(
      backgroundColor: colorScheme.surface,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.chevron_left, color: colorScheme.primary),
      ),
      title: SizedBox(
        width: media.width / 2,
        child: Text(
          "Notifications",
          textAlign: TextAlign.center,
          style: defaultTextStyle(
            color: colorScheme.primary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: goToSettings ?? () {},
          icon: SvgPicture.asset(
            Assets.settingsOutline,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
