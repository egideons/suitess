import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/theme/colors.dart';

import '../../../../../../src/controllers/landlord/landlord_navigation_overview_controller.dart';

class LandLordNavigationOverViewCupertinoScaffold
    extends GetView<LandLordNavigationOverviewController> {
  final int? currentIndex;
  const LandLordNavigationOverViewCupertinoScaffold(
      {super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var controller = LandLordNavigationOverviewController.instance;

    return CupertinoPageScaffold(
      child: Scaffold(
        body: Obx(
          () => controller.landlordNavScreens(
              colorScheme)[controller.landlordNavCurrrentIndex.value],
        ),
        bottomNavigationBar: Obx(
          () {
            return CustomNavigationBar(
              currentIndex:
                  currentIndex ?? controller.landlordNavCurrrentIndex.value,
              backgroundColor: colorScheme.primary,
              selectedColor: colorScheme.surface,
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
