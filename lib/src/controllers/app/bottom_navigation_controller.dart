import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/app/screens/home/screen/home_screen.dart';
import 'package:suitess/app/screens/profile/screen/profile_screen.dart';

import '../../../app/screens/messages/screen/messages_screen.dart';
import '../../../app/screens/wallet/wallet_screen/screen/wallet_screen.dart';
import '../../../app/screens/wallet_intro/screen/wallet_intro_screen.dart';
import '../../../main.dart';
import '../../constants/assets.dart';

class BottomNavigationController extends GetxController {
  static BottomNavigationController get instance {
    return Get.find<BottomNavigationController>();
  }

  var isLoading = false.obs;
  var navCurrentIndex = 0.obs;
  var userHasViewedWalletIntro = prefs.getBool("hasViewedWalletIntro") ?? false;

  //=============== LANDLORD SCREENS ================\\
  navScreens(colorScheme) => [
        const HomeScreen(),
        userHasViewedWalletIntro
            ? const WalletScreen()
            : const WalletIntroScreen(),
        const MessagesScreen(),
        const ProfileScreen(),
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
