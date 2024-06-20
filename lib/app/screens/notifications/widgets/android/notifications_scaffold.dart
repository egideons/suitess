import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/app/notifications_controller.dart';
import '../../../../../theme/colors.dart';
import '../../content/notification_dismissible_widget.dart';
import 'components/app_bar.dart';
import 'components/empty_notification.dart';

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
          child: Scrollbar(
            controller: controller.scrollController,
            child: GetBuilder<NotificationsController>(
              init: NotificationsController(),
              builder: (controller) {
                return !controller.hasNoNotifications.value
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
}
