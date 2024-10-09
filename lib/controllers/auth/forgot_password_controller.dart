import 'package:get/get.dart';

import '../../routes/routes.dart';

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
    isLoading.value = true;
    update();

    await Future.delayed(const Duration(milliseconds: 1000));
    Get.toNamed(Routes.resetPasswordViaEmail, preventDuplicates: true);

    isLoading.value = false;
    update();
  }

  Future<void> navigateToSMS() async {
    items.value = [false, true];
    isLoading.value = true;
    update();

    await Future.delayed(const Duration(milliseconds: 1000));
    Get.toNamed(Routes.resetPasswordViaSms, preventDuplicates: true);

    isLoading.value = false;
    update();
  }
}
