import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance {
    return Get.find<LoginController>();
  }

  var isLoading = false.obs;
  var isResendingOTP = false.obs;

  var responseStatus = 0.obs;
  var responseMessage = "".obs;
}
