import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:suitess/app/splash/loading/screen/loading_screen.dart';
import 'package:suitess/src/controllers/others/loading_controller.dart';

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
        loadData: LoadingController.instance.loadBottomNavgiationView,
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
    //   () => LoadingScreen(
    //     loadData: LoadingController.instance.loadLandLordDashboard,
    //   ),
    //   routeName: "/loading-screen",
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
    //   () => LoadingScreen(
    //     loadData: LoadingController.instance.loadLandLordDashboard,
    //   ),
    //   routeName: "/loading-screen",
    //   fullscreenDialog: true,
    //   curve: Curves.easeInOut,
    //   predicate: (routes) => false,
    //   popGesture: false,
    //   transition: Get.defaultTransition,
    // );
  }
}
