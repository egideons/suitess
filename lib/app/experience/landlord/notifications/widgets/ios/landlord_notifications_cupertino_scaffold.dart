import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                        return Dismissible(
                          key: GlobalKey(),
                          background: ,
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
                                    color: kSuccessColor,
                                  ),
                                ),
                                kHalfWidthSizedBox,
                                Column(
                                  children: [
                                    SizedBox(
                                      width: media.width / 1.4,
                                      child: ReadMoreText(
                                        "Appointment confirmed for 12:00pm, 20th Oct 2021 by Clinton Tia ",
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
                                        "Just now ",
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
