import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/consts.dart';

class ForgotPasswordViaEmailController extends GetxController {
  static ForgotPasswordViaEmailController get instance {
    return Get.find<ForgotPasswordViaEmailController>();
  }

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
  final emailEC = TextEditingController();

  //=========== Focus nodes ===========\\
  final emailFN = FocusNode();

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var isEmailValid = false.obs;
  var formIsValid = false.obs;
  var responseStatus = 0.obs;
  var responseMessage = "".obs;

  //=========== onChanged Functions ===========\\

  emailOnChanged(value) {
    var emailRegExp = RegExp(emailPattern);
    if (!emailRegExp.hasMatch(emailEC.text)) {
      isEmailValid.value = false;
      setFormIsInvalid();
    } else {
      isEmailValid.value = true;
      setFormIsValid();
    }

    update();
  }

  setFormIsValid() {
    formIsValid.value = true;
  }

  setFormIsInvalid() {
    formIsValid.value = false;
  }

  //=========== Login Methods ===========\\
  onSubmitted(value) {
    if (formIsValid.isTrue) {
      toEmailOTP();
    }
  }

  Future<void> toEmailOTP() async {
    isLoading.value = true;
    update();

    await Future.delayed(const Duration(milliseconds: 1000));
    // Get.toNamed(Routes.forgotPasswordViaEmailOTP, preventDuplicates: true);

    isLoading.value = false;
    update();
  }
}
