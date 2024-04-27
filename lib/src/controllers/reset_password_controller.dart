import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kribb/src/controllers/api_processor_controller.dart';

import '../../app/auth/login/screen/login.dart';
import '../constants/consts.dart';

class ResetPasswordController extends GetxController {
  static ResetPasswordController get instance {
    return Get.find<ResetPasswordController>();
  }

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  //=========== Focus nodes ===========\\
  final emailFN = FocusNode();
  final passwordFN = FocusNode();

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var isPasswordValid = false.obs;
  var passwordIsHidden = true.obs;
  var formIsValid = false.obs;

  //=========== passwordOnChanged ===========\\
  passwordOnChanged(value) {
    var passwordRegExp = RegExp(passwordPattern);

    if (!passwordRegExp.hasMatch(passwordEC.text)) {
      isPasswordValid.value = false;
      setFormIsInvalid();
    } else {
      isPasswordValid.value = true;
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
