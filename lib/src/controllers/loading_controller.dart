import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../app/experience/landlord/navigation_overview/screen/landlord_navigation_overview.dart';

class LoadingController extends GetxController {
  static LoadingController get instance {
    return Get.find<LoadingController>();
  }

//============= Variables =============\\
  var isLoading = false.obs;

//============= Load App Sections/Experiences =============\\
  loadLandLordNavgiationOverView() async {
    isLoading.value = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    await Get.offAll(
      () => const LandLordNavigationOverView(),
      routeName: "/landlord-navigation-overview",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
    );

    isLoading.value = true;
    update();
  }

  loadTenantNavgiationOverView() async {
    isLoading.value = true;
    update();

    await Future.delayed(const Duration(days: 3));

    // await Get.offAll(
    //   () => const TenantNavgiationOverView(),
    //   routeName: "/tenant-navigation-overview",
    //   fullscreenDialog: true,
    //   curve: Curves.easeInOut,
    //   predicate: (routes) => false,
    //   popGesture: false,
    //   transition: Get.defaultTransition,
    // );

    isLoading.value = true;
    update();
  }

  loadAgentNavgiationOverView() async {
    isLoading.value = true;
    update();

    await Future.delayed(const Duration(days: 3));

    // await Get.offAll(
    //   () => const AgentNavgiationOverView(),
    //   routeName: "/agent-navigation-overview",
    //   fullscreenDialog: true,
    //   curve: Curves.easeInOut,
    //   predicate: (routes) => false,
    //   popGesture: false,
    //   transition: Get.defaultTransition,
    // );

    isLoading.value = true;
    update();
  }

//============= Load  =============\\
}
