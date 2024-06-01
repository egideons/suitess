import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:suitess/src/controllers/others/api_processor_controller.dart';

import '../../../app/auth/login/screen/login.dart';
import '../../constants/consts.dart';

class ResetPasswordController extends GetxController {
  static ResetPasswordController get instance {
    return Get.find<ResetPasswordController>();
  }

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  //=========== Focus nodes ===========\\
  final passwordFN = FocusNode();
  final confirmPasswordFN = FocusNode();

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var isPasswordValid = false.obs;
  var isConfirmPasswordValid = false.obs;
  var passwordIsHidden = true.obs;
  var confirmPasswordIsHidden = true.obs;
  var formIsValid = false.obs;

  //=========== passwordOnChanged ===========\\
  passwordOnChanged(value) {
    var passwordRegExp = RegExp(passwordPattern);
    if (!passwordRegExp.hasMatch(passwordEC.text)) {
      isPasswordValid.value = false;
    } else {
      isPasswordValid.value = true;
      update();
    }

    update();
  }

  confirmPasswordOnChanged(value) {
    var passwordRegExp = RegExp(passwordPattern);

    if (!passwordRegExp.hasMatch(passwordEC.text)) {
      isConfirmPasswordValid.value = false;
      setFormIsInvalid();
    } else {
      isConfirmPasswordValid.value = true;
      setFormIsValid();
      update();
    }

    update();
  }

  setFormIsValid() {
    formIsValid.value = true;
  }

  setFormIsInvalid() {
    formIsValid.value = false;
  }

  //=========== Submit ===========\\
  onSubmitted(value) {
    if (formIsValid.isTrue) {
      resetPassword();
    }
  }

  Future<void> resetPassword() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (passwordEC.text.isEmpty) {
        ApiProcessorController.errorSnack("Please enter your password");
        return;
      } else if (confirmPasswordEC.text.isEmpty) {
        ApiProcessorController.errorSnack("Please confirm your password");
        return;
      } else if (confirmPasswordEC.text != passwordEC.text) {
        ApiProcessorController.errorSnack("Passwords do not match");
        return;
      }
      isLoading.value = true;
      update();

      await Future.delayed(const Duration(seconds: 2));
      ApiProcessorController.successSnack("Password reset successful");

      Get.offAll(
        () => const Login(),
        routeName: "/login",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
      );

      isLoading.value = false;
      update();
    }
  }
}
