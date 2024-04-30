import 'package:get/get.dart';

class LoadingController extends GetxController {
  static LoadingController get instance {
    return Get.find<LoadingController>();
  }

//============= Variables =============\\
  var isLoading = false.obs;

//============= Functions =============\\
  loadDashboard() async {
    isLoading.value = true;
    update();

    await Future.delayed(const Duration(days: 3));

    // await Get.offAll(
    //   () => const Dashboard(),
    //   routeName: "/signup",
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
