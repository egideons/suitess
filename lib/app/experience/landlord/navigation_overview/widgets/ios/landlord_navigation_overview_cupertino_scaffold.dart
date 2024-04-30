import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/theme/colors.dart';

import '../../../../../../src/controllers/navigation_overview_controller.dart';

class LandLordNavigationOverViewCupertinoScaffold extends StatelessWidget {
  const LandLordNavigationOverViewCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = NavigationOverviewController.instance;

    return CupertinoPageScaffold(
      child: Scaffold(
        extendBody: true,
        body: Obx(
          () => controller.landlordNavScreens(
              colorScheme)[controller.landlordNavCurrrentIndex.value],
        ),
        bottomNavigationBar: Obx(
          () {
            return CustomNavigationBar(
              currentIndex: controller.landlordNavCurrrentIndex.value,
              backgroundColor: colorScheme.primary,
              selectedColor: colorScheme.background,
              unSelectedColor: colorScheme.inversePrimary,
              strokeColor: kAccentColor,
              isFloating: true,
              borderRadius: const Radius.circular(24),
              items: controller.landLordNavItems(colorScheme),
              onTap: (index) =>
                  controller.landlordNavCurrrentIndex.value = index,
            );
          },
        ),
      ),
    );
  }
}
