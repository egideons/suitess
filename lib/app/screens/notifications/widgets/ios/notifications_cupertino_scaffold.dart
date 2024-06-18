import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/app/notifications_controller.dart';
import '../../../../../src/utils/buttons/ios/scroll_to_top_cupertino_button.dart';
import '../../../../../theme/colors.dart';
import '../../content/notification_dismissible_widget.dart';

class NotificationsCupertinoScaffold extends GetView<NotificationsController> {
  const NotificationsCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = NotificationsController.instance;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "Home",
        transitionBetweenRoutes: true,
        backgroundColor: colorScheme.surface,
        border: Border.all(color: colorScheme.surface),
        middle: SizedBox(
          width: media.width / 2,
          child: Text(
            "Nofitications",
            textAlign: TextAlign.center,
            style: defaultTextStyle(
              color: colorScheme.primary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      child: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: controller.onRefresh,
          child: CupertinoScrollbar(
            controller: controller.scrollController,
            child: Stack(
              children: [
                GetBuilder<NotificationsController>(
                  init: NotificationsController(),
                  builder: (controller) {
                    return controller.hasUnreadNotifications.value
                        ? Container(
                            height: media.height / 2,
                            width: media.width,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.notification5,
                                  color: kAccentColor,
                                  size: media.height / 4,
                                ),
                                kSizedBox,
                                Text(
                                  "You have no unread notifications",
                                  textAlign: TextAlign.center,
                                  style: defaultTextStyle(
                                    color: colorScheme.primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.separated(
                            controller: controller.scrollController,
                            itemCount: 10,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(10),
                            separatorBuilder: (context, index) => kHalfSizedBox,
                            itemBuilder: (context, index) {
                              return notificationDismissibleWidget(
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
                kSizedBox,
                Obx(
                  () => controller.isScrollToTopBtnVisible.value
                      ? Positioned(
                          bottom: 16.0,
                          right: 16.0,
                          child: scrollToTopCupertinoButton(controller),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
