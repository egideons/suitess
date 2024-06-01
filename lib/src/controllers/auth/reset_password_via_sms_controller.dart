import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/consts.dart';
import '../../routes/routes.dart';
import '../others/api_processor_controller.dart';

class ResetPasswordViaSMSController extends GetxController {
  static ResetPasswordViaSMSController get instance {
    return Get.find<ResetPasswordViaSMSController>();
  }

  @override
  void onInit() {
    emailFN.requestFocus();
    super.onInit();
  }

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
  final phoneNumberEC = TextEditingController();

  //=========== Focus nodes ===========\\
  final emailFN = FocusNode();

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var isPhoneNumberValid = false.obs;
  var formIsValid = false.obs;
  var responseStatus = 0.obs;
  var responseMessage = "".obs;

  //=========== onChanged Functions ===========\\

  phoneNumberOnChanged(value) {
    var phoneRegExp = RegExp(phoneNumberPattern);
    if (!phoneRegExp.hasMatch(phoneNumberEC.text)) {
      isPhoneNumberValid.value = false;
      setFormIsInvalid();
    } else {
      isPhoneNumberValid.value = true;
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

  navigateToEmail() async {
    Get.toNamed(Routes.resetPasswordViaEmail, preventDuplicates: true);
  }

  //=========== Login Methods ===========\\
  onSubmitted(value) {
    if (formIsValid.isTrue) {
      submitEmail();
    }
  }

  Future<void> submitEmail() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (phoneNumberEC.text.isEmpty) {
        ApiProcessorController.errorSnack("Please enter your email");
        return;
      } else if (isPhoneNumberValid.value == false) {
        ApiProcessorController.errorSnack("Please enter a valid email");
        return;
      }

      isLoading.value = true;
      update();

      await Future.delayed(const Duration(milliseconds: 1000));
      ApiProcessorController.successSnack("An OTP has been sent to your email");

      Get.toNamed(Routes.resetPasswordViaEmailOTP, preventDuplicates: true);

      isLoading.value = false;
      update();
    }
  }
}
