import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/app/notifications_controller.dart';
import '../../../../../theme/colors.dart';
import 'android_empty_notification.dart';
import 'android_notification_widget.dart';
import 'android_notifications_app_bar.dart';

class AndroidNotificationsScaffold extends GetView<NotificationsController> {
  const AndroidNotificationsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    var controller = NotificationsController.instance;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: androidNotificationsScreenAppBar(colorScheme, media),
      floatingActionButton: Obx(
        () => controller.isScrollToTopBtnVisible.value
            ? FloatingActionButton.small(
                onPressed: controller.scrollToTop,
                backgroundColor: colorScheme.secondary,
                foregroundColor: kWhiteBackgroundColor,
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
                return controller.hasNoNotifications.value
                    ? androidEmptyNotifications(media, colorScheme)
                    : Container(
                        margin: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          color: colorScheme.surface,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: [
                            BoxShadow(
                              color: colorScheme.inversePrimary.withOpacity(.2),
                              offset: const Offset(0, 4),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ListView.separated(
                          controller: controller.scrollController,
                          itemCount: 30,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 2),
                          itemBuilder: (context, index) {
                            return androidNotificationWidget(
                              colorScheme,
                              media,
                              notificationTitle: "Appointment",
                              notificationMessage:
                                  "Appointment confirmed for 12:00pm, 20th Oct 2021 by Clinton Tia",
                              notificationTime: "Just now",
                              notificationColor: kSuccessColor,
                            );
                          },
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
