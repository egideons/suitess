import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance {
    return Get.find<ForgotPasswordController>();
  }

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var formIsValid = false.obs;
  var items = [true, false].obs;

  //================== Navigation ==================\\
  Future<void> navigateToEmail() async {
    items.value = [true, false];
    update();
  }

  Future<void> navigateToSMS() async {
    items.value = [false, true];
    update();
  }
}
