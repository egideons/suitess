import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:suitess/app/android/my%20_business/lands_and_properties/properties_home/screen/lands_and_properties_screen.dart';

import '../../../app/android/auth/login/screen/login.dart';
import '../../../app/android/bottom_nav_view/screen/bottom_navigation_view.dart';
import '../../../main.dart';
import '../auth/user_controller.dart';

class LoadingController extends GetxController {
  static LoadingController get instance {
    return Get.find<LoadingController>();
  }

//============= Variables =============\\
  var isLoading = false.obs;

//============= Load BottomNavView =============\\
  loadHome() async {
    isLoading.value = true;
    update();

    await UserController.instance.getUserProfile();

    await Get.offAll(
      () => const BottomNavigationView(),
      routeName: "/home",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
    );

    isLoading.value = true;
    update();
  }

  loadWalletTab() async {
    isLoading.value = true;
    update();

    await Get.offAll(
      () => const BottomNavigationView(currentIndex: 1),
      routeName: "/wallet",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
    );

    isLoading.value = true;
    update();
  }

  loadLandsAndProperties() async {
    isLoading.value = true;
    update();

    await Get.off(
      () => const LandsAndPropertiesScreen(),
      routeName: "/lands-and-properties",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      preventDuplicates: true,
      popGesture: false,
      transition: Get.defaultTransition,
    );

    isLoading.value = true;
    update();
  }

  loadHotelManagement() async {
    isLoading.value = true;
    update();

    // await Get.off(
    //   () => const MyBusinessScreen(),
    //   routeName: "/my-business",
    //   fullscreenDialog: true,
    //   curve: Curves.easeInOut,
    //   preventDuplicates: true,
    //   popGesture: false,
    //   transition: Get.defaultTransition,
    // );

    isLoading.value = true;
    update();
  }

//============= Logout =============\\
  logout() async {
    isLoading.value = true;
    update();

    UserController.deleteUserSignupData();

    //Clear the user token
    await prefs.setString("userToken", "");

    await Future.delayed(const Duration(seconds: 2));

    await Get.offAll(
      () => const Login(),
      routeName: "/login",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
    );

    isLoading.value = true;
    update();
  }

//============= Load  =============\\
}
