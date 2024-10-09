import 'dart:async';

import 'package:get/get.dart';

import '../../routes/routes.dart';

class CongratulationsSplashScreenController extends GetxController {
  static CongratulationsSplashScreenController get instance {
    return Get.find<CongratulationsSplashScreenController>();
  }

  var isLoading = false.obs;

  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () {
      goToNextPage();
    });
    super.onInit();
  }

  Future<void> goToNextPage() async {
    await Get.offAndToNamed(Routes.chooseExperience);

    // await Get.off(
    //   () => const ChooseExperience(),
    //   routeName: "/choose-experience",
    //   fullscreenDialog: true,
    //   curve: Curves.easeInOut,
    //   preventDuplicates: true,
    //   popGesture: false,
    //   transition: Get.defaultTransition,
    // );
  }
}
