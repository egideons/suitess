import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/consts.dart';

import '../../../../src/controllers/app/bottom_navigation_controller.dart';

class BottomNavigationViewScaffold extends GetView<BottomNavigationController> {
  final int currentIndex;

  const BottomNavigationViewScaffold({this.currentIndex = 0, super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    // Set the initial index when the widget is built
    controller.navCurrentIndex.value = currentIndex;

    return Obx(() {
      if (controller.navCurrentIndex.value == 1 &&
          !controller.userHasViewedWalletIntro) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          body: Obx(
            () => controller
                .navScreens(colorScheme)[controller.navCurrentIndex.value],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.navCurrentIndex.value,
            onTap: (index) => controller.navCurrentIndex.value = index,
            items: controller.bottomNavItems(colorScheme),
            backgroundColor: colorScheme.surface,
            enableFeedback: true,
            elevation: 20,
            mouseCursor: SystemMouseCursors.click,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            selectedItemColor: colorScheme.secondary,
            unselectedItemColor: colorScheme.inversePrimary,
            showUnselectedLabels: true,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedIconTheme: IconThemeData(color: colorScheme.secondary),
            selectedLabelStyle: defaultTextStyle(color: colorScheme.secondary),
          ),
        );
      } else {
        return WillPopScope(
          onWillPop:
              controller.handleBackNavigation, // Call back navigation handler
          child: Scaffold(
            backgroundColor: colorScheme.surface,
            body: Obx(
              () => controller
                  .navScreens(colorScheme)[controller.navCurrentIndex.value],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.navCurrentIndex.value,
              onTap: (index) => controller.navCurrentIndex.value = index,
              items: controller.bottomNavItems(colorScheme),
              backgroundColor: colorScheme.surface,
              enableFeedback: true,
              elevation: 20,
              // landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
              mouseCursor: SystemMouseCursors.click,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              selectedItemColor: colorScheme.secondary,
              showUnselectedLabels: true,
              unselectedItemColor: colorScheme.inversePrimary,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              selectedIconTheme: IconThemeData(color: colorScheme.secondary),
              selectedLabelStyle:
                  defaultTextStyle(color: colorScheme.secondary),
            ),
          ),
        );
      }
    });
  }
}
