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

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Obx(
        () => controller
            .navScreens(colorScheme)[controller.navCurrentIndex.value],
      ),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            items: controller.bottomNavItems(colorScheme),
            onTap: (index) => controller.navCurrentIndex.value = index,
            currentIndex: controller.navCurrentIndex.value,
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
            selectedLabelStyle: defaultTextStyle(color: colorScheme.secondary),
          );
        },
      ),
    );
  }
}
