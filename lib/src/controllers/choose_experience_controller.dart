import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kribb/app/splash/loading/screen/loading_screen.dart';

class ChooseExperienceController extends GetxController {
  static ChooseExperienceController get instance {
    return Get.find<ChooseExperienceController>();
  }

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var formIsValid = false.obs;
  var items = [true, false, false].obs;

  //=========== Variables ===========\\
  var responseStatus = 0.obs;
  var responseMessage = "".obs;

  //================== Navigation ==================\\
  Future<void> navigateToLandlord() async {
    items.value = [true, false, false];
    update();

    await Get.offAll(
      () => LoadingScreen(
        loadData: () {
          // Get.offAll(
          //   () => LandLordDashBoard(),
          //   routeName: "/landlord-dashboard",
          //   fullscreenDialog: true,
          //   curve: Curves.easeInOut,
          //   predicate: (routes) => false,
          //   popGesture: false,
          //   transition: Get.defaultTransition,
          // );
        },
      ),
      routeName: "/loading-screen",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }

  Future<void> navigateToTenant() async {
    items.value = [false, true, false];
    update();
    // await Get.offAll(
    //   () => const TenantDashBoard(),
    //   routeName: "/landlord-dashboard",
    //   fullscreenDialog: true,
    //   curve: Curves.easeInOut,
    //   predicate: (routes) => false,
    //   popGesture: false,
    //   transition: Get.defaultTransition,
    // );
  }

  Future<void> navigateToAgent() async {
    items.value = [false, false, true];
    update();
    // await Get.offAll(
    //   () => const AgentDashboard(),
    //   routeName: "/landlord-dashboard",
    //   fullscreenDialog: true,
    //   curve: Curves.easeInOut,
    //   predicate: (routes) => false,
    //   popGesture: false,
    //   transition: Get.defaultTransition,
    // );
  }
}
