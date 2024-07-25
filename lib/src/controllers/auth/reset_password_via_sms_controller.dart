import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/auth/reset_password_otp/via_sms/screen/reset_password_via_sms_otp.dart';
import '../../constants/consts.dart';
import '../../routes/routes.dart';
import '../others/api_processor_controller.dart';

class ResetPasswordViaSMSController extends GetxController {
  static ResetPasswordViaSMSController get instance {
    return Get.find<ResetPasswordViaSMSController>();
  }

  @override
  void onInit() {
    phoneNumberFN.requestFocus();
    super.onInit();
  }

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
  final phoneNumberEC = TextEditingController();

  //=========== Focus nodes ===========\\
  final phoneNumberFN = FocusNode();

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var isPhoneNumberValid = false.obs;
  var formIsValid = false.obs;
  var responseStatus = 0.obs;
  var responseMessage = "".obs;

  //=========== onChanged Functions ===========\\

  phoneNumberOnChanged(value) {
    var phoneNumberRegExp = RegExp(mobilePattern);
    if (!phoneNumberRegExp.hasMatch(phoneNumberEC.text)) {
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
    Get.offNamed(Routes.resetPasswordViaEmail, preventDuplicates: true);
  }

  //=========== Login Methods ===========\\
  onSubmitted(value) {
    if (formIsValid.isTrue) {
      submitPhoneNumber();
    }
  }

  Future<void> submitPhoneNumber() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (phoneNumberEC.text.isEmpty) {
        ApiProcessorController.errorSnack("Please enter your phone number");
        setFormIsInvalid();
        return;
      } else if (isPhoneNumberValid.value == false) {
        ApiProcessorController.errorSnack("Please enter a valid phone number");
        setFormIsInvalid();
        return;
      }

      isLoading.value = true;
      update();

      await Future.delayed(const Duration(milliseconds: 1000));
      ApiProcessorController.successSnack(
        "An OTP has been sent to your phone number",
      );

      await Get.to(
        () => ResetPasswordViaSMSOTP(userPhoneNumber: phoneNumberEC.text),
        routeName: "/reset-password-via-sms-otp",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        preventDuplicates: true,
        popGesture: false,
        transition: Get.defaultTransition,
      );

      isLoading.value = false;
      update();
    }
  }
}
