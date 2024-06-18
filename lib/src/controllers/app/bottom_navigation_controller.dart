import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suitess/app/screens/home/screen/landlord_home_screen.dart';
import 'package:suitess/src/constants/consts.dart';

import '../../../theme/colors.dart';
import '../../constants/assets.dart';

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
        BottomNavigationBarItem(
          label: "Home",
          tooltip: "Home",
          icon: SvgPicture.asset(
            Assets.homeFilledIconSvg,
            fit: BoxFit.cover,
          ),
          activeIcon: SvgPicture.asset(
            Assets.homeFilledIconSvg,
            color: kAccentColor,
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
            color: kAccentColor,
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
            color: kAccentColor,
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
            color: kAccentColor,
            fit: BoxFit.cover,
          ),
        ),
      ];

  //=============== LANDLORD SECTION ================\\
  var navCurrrentIndex = 0.obs;
}
