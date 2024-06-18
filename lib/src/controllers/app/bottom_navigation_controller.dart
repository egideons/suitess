import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suitess/app/screens/home/screen/landlord_home_screen.dart';
import 'package:suitess/src/constants/consts.dart';

class BottomNavigationController extends GetxController {
  static BottomNavigationController get instance {
    return Get.find<BottomNavigationController>();
  }

  var isLoading = false.obs;

  //=============== LANDLORD SCREENS ================\\
  navScreens(colorScheme) => [
        const HomeScreen(),
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
          selectedIcon: const Icon(Icon.solidUser),
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
  var navCurrrentIndex = 0.obs;
}
