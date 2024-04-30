import 'package:floating_navigation_bar/floating_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kribb/src/constants/consts.dart';

import '../../../../../../src/controllers/navigation_overview_controller.dart';

class LandLordNavigationOverViewCupertinoScaffold extends StatelessWidget {
  const LandLordNavigationOverViewCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = NavigationOverviewController.instance;

    return Scaffold(
      body: Obx(
        () => controller
            .screens(colorScheme)[controller.landlordNavCurrrentIndex.value],
      ),
      bottomNavigationBar: FloatingNavigationBar(
        backgroundColor: colorScheme.primary,
        onChanged: (index) => controller.landlordNavCurrrentIndex.value = index,
        iconColor: colorScheme.background,
        indicatorColor: colorScheme.background,
        barHeight: 60.0,
        iconSize: 20.0,
        indicatorHeight: 5,
        indicatorWidth: 14.0,
        textStyle: defaultTextStyle(
          color: colorScheme.background,
          fontSize: 14.0,
        ),
        items: [
          NavBarItems(
            icon: Iconsax.home,
            title: "Home",
          ),
          NavBarItems(
            icon: Iconsax.wallet,
            title: "Wallet",
          ),
          NavBarItems(
            icon: Iconsax.message,
            title: "Chat",
          ),
          NavBarItems(
            icon: Iconsax.user,
            title: "Profile",
          ),
        ],
      ),
    );
  }
}
