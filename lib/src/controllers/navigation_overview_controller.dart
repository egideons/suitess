import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/src/constants/consts.dart';

class NavigationOverviewController extends GetxController {
  static NavigationOverviewController get instance {
    return Get.find<NavigationOverviewController>();
  }

  var isLoading = false.obs;

  //=============== LANDLORD SECTION ================\\
  screens(colorScheme) => [
        Container(
          color: colorScheme.background,
          child: Center(
            child: Text(
              "Home",
              style: defaultTextStyle(),
            ),
          ),
        ),
        Container(
          color: colorScheme.background,
          child: Center(
            child: Text(
              "Wallet",
              style: defaultTextStyle(),
            ),
          ),
        ),
        Container(
          color: colorScheme.background,
          child: Center(
            child: Text(
              "Chat",
              style: defaultTextStyle(),
            ),
          ),
        ),
        Container(
          color: colorScheme.background,
          child: Center(
            child: Text(
              "Profile",
              style: defaultTextStyle(),
            ),
          ),
        ),
      ];

  //=============== LANDLORD SECTION ================\\
  var landlordNavCurrrentIndex = 0.obs;

  landLordNavOnChanged(index) {
    landlordNavCurrrentIndex.value = index;
    update();
  }
}
