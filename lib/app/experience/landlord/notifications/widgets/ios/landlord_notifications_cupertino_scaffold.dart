import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/controllers/landlord_notifications_controller.dart';

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
      ),
      child: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: controller.onRefresh,
          child: CupertinoScrollbar(
            child: GetBuilder<LandLordNotificationsController>(
              init: LandLordNotificationsController(),
              builder: (controller) {
                return ListView.separated(
                  separatorBuilder: (context, index) => kSizedBox,
                  itemCount: 20,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      width: media.width,
                      decoration: ShapeDecoration(
                        color: colorScheme.background,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        shadows: [
                          BoxShadow(
                            color: colorScheme.primary.withOpacity(0.2),
                            offset: const Offset(4, 10),
                            blurRadius: 10,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
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
