import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../app/bottom_nav_view/screen/bottom_navigation_view.dart';

class LoadingController extends GetxController {
  static LoadingController get instance {
    return Get.find<LoadingController>();
  }

//============= Variables =============\\
  var isLoading = false.obs;

//============= Load App Sections/Experiences =============\\
  bottomNavgiationView() async {
    isLoading.value = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

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

//============= Load  =============\\
}
