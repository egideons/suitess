import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance {
    return Get.find<SignupController>();
  }

  var isLoading = false.obs;
  var isFirstNameValid = false.obs;
  var isLastNameValid = false.obs;
  var isEmailValid = false.obs;
  var isPhoneNumberValid = false.obs;
  var isPasswordValid = false.obs;

  var responseStatus = 0.obs;
  var responseMessage = "".obs;
}
