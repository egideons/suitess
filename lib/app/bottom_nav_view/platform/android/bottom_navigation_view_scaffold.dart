import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/theme/colors.dart';

import '../../../../src/controllers/app/bottom_navigation_controller.dart';

class BottomNavigationViewScaffold extends GetView<BottomNavigationController> {
  final int? currentIndex;

  const BottomNavigationViewScaffold({this.currentIndex, super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var controller = BottomNavigationController.instance;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      // extendBody: true,
      body: Obx(
        () => controller
            .navScreens(colorScheme)[controller.navCurrrentIndex.value],
      ),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            items: controller.landLordNavItems(colorScheme),

            onTap: (index) => controller.navCurrrentIndex.value = index,
            currentIndex: currentIndex ?? controller.navCurrrentIndex.value,
            backgroundColor: colorScheme.surface,
            enableFeedback: true,
            elevation: 20,
            // landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
            mouseCursor: SystemMouseCursors.click,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            selectedItemColor: kAccentColor,
            showUnselectedLabels: true,
            unselectedItemColor: colorScheme.inversePrimary,
            selectedFontSize: 12,
            unselectedFontSize: 12,

            selectedIconTheme: IconThemeData(color: kAccentColor),
            selectedLabelStyle: defaultTextStyle(color: kAccentColor),
          );
        },
      ),
    );
  }
}
