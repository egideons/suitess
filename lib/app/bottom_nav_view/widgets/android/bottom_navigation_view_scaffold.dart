import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../src/controllers/app/landlord_navigation_overview_controller.dart';
import '../../../../theme/colors.dart';

class BottomNavigationViewScaffold extends GetView<BottomNavigationController> {
  final int? currentIndex;

  const BottomNavigationViewScaffold({this.currentIndex, super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var controller = BottomNavigationController.instance;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Obx(
        () => controller
            .navScreens(colorScheme)[controller.navCurrrentIndex.value],
      ),
      bottomNavigationBar: Obx(
        () {
          return CustomNavigationBar(
            currentIndex: currentIndex ?? controller.navCurrrentIndex.value,
            backgroundColor: colorScheme.primary,
            selectedColor: colorScheme.surface,
            unSelectedColor: colorScheme.inversePrimary,
            strokeColor: kAccentColor,
            isFloating: true,
            borderRadius: const Radius.circular(24),
            items: controller.landLordNavItems(colorScheme),
            onTap: (index) => controller.navCurrrentIndex.value = index,
          );
        },
      ),
    );
  }
}
