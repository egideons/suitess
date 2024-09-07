import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../app/auth/login/screen/login.dart';
import '../../../app/bottom_nav_view/screen/bottom_navigation_view.dart';
import '../auth/user_controller.dart';

class LoadingController extends GetxController {
  static LoadingController get instance {
    return Get.find<LoadingController>();
  }

//============= Variables =============\\
  var isLoading = false.obs;

//============= Load BottomNavView =============\\
  loadBottomNavgiationView() async {
    isLoading.value = true;
    update();

    await Get.offAll(
      () => const BottomNavigationView(),
      routeName: "/bottom-navigation-view",
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

    await UserController.instance.getUserProfile();

    await Get.offAll(
      () => const BottomNavigationView(currentIndex: 1),
      routeName: "/bottom-navigation-view",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
    );

    isLoading.value = true;
    update();
  }

//============= Logout =============\\
  logout() async {
    isLoading.value = true;
    update();

    UserController.deleteUserSignupData();

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
