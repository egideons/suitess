import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suitess/app/experience/landlord/home/screen/landlord_home_screen.dart';
import 'package:suitess/src/constants/consts.dart';

class LandLordNavigationOverviewController extends GetxController {
  static LandLordNavigationOverviewController get instance {
    return Get.find<LandLordNavigationOverviewController>();
  }

  var isLoading = false.obs;

  //=============== LANDLORD SCREENS ================\\
  landlordNavScreens(colorScheme) => [
        const LandLordHomeScreen(),
        Container(
          color: colorScheme.surface,
          child: Center(
            child: Text(
              "Wallet",
              style: defaultTextStyle(),
            ),
          ),
        ),
        Container(
          color: colorScheme.surface,
          child: Center(
            child: Text(
              "Chat",
              style: defaultTextStyle(),
            ),
          ),
        ),
        Container(
          color: colorScheme.surface,
          child: Center(
            child: Text(
              "Profile",
              style: defaultTextStyle(),
            ),
          ),
        ),
      ];

  //=============== LANDLORD BOTTOMNAV ITEMS ================\\
  landLordNavItems(colorScheme) => [
        CustomNavigationBarItem(
          icon: const Icon(Iconsax.home),
          selectedIcon: const Icon(Iconsax.home1),
          title: Text(
            "",
            style: defaultTextStyle(color: colorScheme.surface),
          ),
          selectedTitle: Text(
            "Home",
            style: defaultTextStyle(color: colorScheme.surface),
          ),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Iconsax.wallet_2),
          selectedIcon: const Icon(Iconsax.wallet_money1),
          title: Text(
            "",
            style: defaultTextStyle(color: colorScheme.surface),
          ),
          selectedTitle: Text(
            "Wallet",
            style: defaultTextStyle(color: colorScheme.surface),
          ),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Iconsax.message),
          selectedIcon: const Icon(Iconsax.message5),
          title: Text(
            "",
            style: defaultTextStyle(color: colorScheme.surface),
          ),
          selectedTitle: Text(
            "Chat",
            style: defaultTextStyle(color: colorScheme.surface),
          ),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Iconsax.user),
          selectedIcon: const FaIcon(FontAwesomeIcons.solidUser),
          title: Text(
            "",
            style: defaultTextStyle(color: colorScheme.surface),
          ),
          selectedTitle: Text(
            "Profile",
            style: defaultTextStyle(color: colorScheme.surface),
          ),
        ),
      ];

  //=============== LANDLORD SECTION ================\\
  var landlordNavCurrrentIndex = 0.obs;
}
