import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance {
    return Get.find<SignupController>();
  }

  var isLoading = false.obs;
  var isResendingOTP = false.obs;

  var responseStatus = 0.obs;
  var responseMessage = "".obs;
}
