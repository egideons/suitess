import 'package:get/get.dart';

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
  }

  Future<void> navigateToTenant() async {
    items.value = [false, true, false];
    update();
  }

  Future<void> navigateToAgent() async {
    items.value = [false, false, true];
    update();
  }
}
