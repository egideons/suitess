import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/views/android/screens/home/screen/android_home_screen.dart';
import 'package:suitess/views/android/screens/messages/screen/android_messages_screen.dart';
import 'package:suitess/views/android/screens/profile/screen/android_profile_screen.dart';
import 'package:suitess/views/android/screens/wallet/wallet_intro/screen/android_wallet_intro_screen.dart';
import 'package:suitess/views/android/screens/wallet/wallet_screen/screen/wallet_screen.dart';

import '../../../main.dart';
import '../../constants/assets.dart';

class BottomNavigationController extends GetxController {
  static BottomNavigationController get instance {
    return Get.find<BottomNavigationController>();
  }

  var isLoading = false.obs;
  var navCurrentIndex = 0.obs;
  var userHasViewedWalletIntro = prefs.getBool("hasViewedWalletIntro") ?? false;

  // Method to handle back navigation
  Future<bool> handleBackNavigation() async {
    if (navCurrentIndex.value != 0) {
      // If not on the first tab, navigate back to the Home tab
      navCurrentIndex.value = 0;
      return false; // Prevent app from closing
    }
    return true; // Allow app to close if already on the first tab
  }

  //=============== LANDLORD SCREENS ================\\
  navScreens(colorScheme) => [
        const AndroidHomeScreen(),
        userHasViewedWalletIntro
            ? const WalletScreen()
            : const AndroidWalletIntroScreen(),
        const AndroidMessagesScreen(),
        const AndroidProfileScreen(),
      ];

  //=============== BOTTOMNAV ITEMS ================\\
  bottomNavItems(colorScheme) => [
        BottomNavigationBarItem(
          label: "Home",
          tooltip: "Home",
          icon: SvgPicture.asset(
            Assets.homeFilledIconSvg,
            fit: BoxFit.cover,
          ),
          activeIcon: SvgPicture.asset(
            Assets.homeFilledIconSvg,
            color: colorScheme.secondary,
            fit: BoxFit.cover,
          ),
        ),
        BottomNavigationBarItem(
          label: "Wallet",
          tooltip: "Wallet",
          icon: SvgPicture.asset(
            Assets.walletFilledIconSvg,
            fit: BoxFit.cover,
          ),
          activeIcon: SvgPicture.asset(
            color: colorScheme.secondary,
            Assets.walletFilledIconSvg,
            fit: BoxFit.cover,
          ),
        ),
        BottomNavigationBarItem(
          label: "Messages",
          tooltip: "Messages",
          icon: SvgPicture.asset(
            Assets.chatFilledIconSvg,
            fit: BoxFit.cover,
          ),
          activeIcon: SvgPicture.asset(
            Assets.chatFilledIconSvg,
            color: colorScheme.secondary,
            fit: BoxFit.cover,
          ),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          tooltip: "Profile",
          icon: SvgPicture.asset(
            Assets.userFilledIconSvg,
            fit: BoxFit.cover,
          ),
          activeIcon: SvgPicture.asset(
            Assets.userFilledIconSvg,
            color: colorScheme.secondary,
            fit: BoxFit.cover,
          ),
        ),
      ];
}
