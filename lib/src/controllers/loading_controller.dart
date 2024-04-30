import 'package:get/get.dart';

class LoadingController extends GetxController {
  static LoadingController get instance {
    return Get.find<LoadingController>();
  }

//============= Variables =============\\
  var isLoading = false.obs;

//============= Functions =============\\
  loadLandLordDashboard() async {
    isLoading.value = true;
    update();

    await Future.delayed(const Duration(days: 3));

    // await Get.offAll(
    //   () => const LandLordDashboard(),
    //   routeName: "/landlord-dashboard",
    //   fullscreenDialog: true,
    //   curve: Curves.easeInOut,
    //   predicate: (routes) => false,
    //   popGesture: false,
    //   transition: Get.defaultTransition,
    // );

    isLoading.value = true;
    update();
  }

  loadTenantDashboard() async {
    isLoading.value = true;
    update();

    await Future.delayed(const Duration(days: 3));

    // await Get.offAll(
    //   () => const TenantDashboard(),
    //   routeName: "/tenant-dashbaord",
    //   fullscreenDialog: true,
    //   curve: Curves.easeInOut,
    //   predicate: (routes) => false,
    //   popGesture: false,
    //   transition: Get.defaultTransition,
    // );

    isLoading.value = true;
    update();
  }

  loadAgentDashboard() async {
    isLoading.value = true;
    update();

    await Future.delayed(const Duration(days: 3));

    // await Get.offAll(
    //   () => const AgentDashboard(),
    //   routeName: "/agent-dashboard",
    //   fullscreenDialog: true,
    //   curve: Curves.easeInOut,
    //   predicate: (routes) => false,
    //   popGesture: false,
    //   transition: Get.defaultTransition,
    // );

    isLoading.value = true;
    update();
  }
}
