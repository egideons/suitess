import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kribb/theme/colors.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/controllers/landlord_notifications_controller.dart';
import '../../../../../../src/utils/buttons/ios/scroll_to_top_cupertino_button.dart';

class LandLordNotificationsCupertinoScaffold
    extends GetView<LandLordNotificationsController> {
  const LandLordNotificationsCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = LandLordNotificationsController.instance;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "Home",
        transitionBetweenRoutes: true,
        backgroundColor: colorScheme.background,
        border: Border.all(color: colorScheme.background),
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
                GetBuilder<LandLordNotificationsController>(
                  init: LandLordNotificationsController(),
                  builder: (controller) {
                    return ListView.separated(
                      controller: controller.scrollController,
                      itemCount: 30,
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

  notificationDismissibleWidget(
    colorScheme,
    media, {
    onDismissed,
    notificationColor,
    notificationMessage,
    notificationTime,
  }) {
    return Dismissible(
      key: GlobalKey(),
      direction: DismissDirection.endToStart,
      onDismissed: onDismissed ?? (direction) {},
      background: Container(
        decoration: BoxDecoration(color: colorScheme.background),
        width: media.width,
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: kRedColor,
              shape: const CircleBorder(),
            ),
            child: Icon(
              Iconsax.trash,
              color: kLightBackgroundColor,
            ),
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: media.width,
        decoration: ShapeDecoration(
          color: colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: [
            BoxShadow(
              color: colorScheme.primary.withOpacity(0.1),
              offset: const Offset(4, 10),
              blurRadius: 10,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 8,
              width: 8,
              decoration: ShapeDecoration(
                shape: const CircleBorder(),
                color: notificationColor ?? colorScheme.inversePrimary,
              ),
            ),
            kHalfWidthSizedBox,
            Column(
              children: [
                SizedBox(
                  width: media.width / 1.4,
                  child: ReadMoreText(
                    notificationMessage ?? "",
                    trimMode: TrimMode.Line,
                    trimLines: 4,
                    textAlign: TextAlign.start,
                    style: defaultTextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: media.width / 1.4,
                  child: Text(
                    notificationTime ?? "",
                    textAlign: TextAlign.start,
                    style: defaultTextStyle(
                      color: colorScheme.inversePrimary,
                      fontWeight: FontWeight.normal,
                      fontSize: 8,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
