import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/theme/colors.dart';

import '../../../../src/controllers/app/landlord_navigation_overview_controller.dart';

class BottomNavigationViewCupertinoScaffold
    extends GetView<BottomNavigationController> {
  final int? currentIndex;
  const BottomNavigationViewCupertinoScaffold({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var controller = BottomNavigationController.instance;

    return CupertinoPageScaffold(
      child: Scaffold(
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
      ),
    );
  }
}
