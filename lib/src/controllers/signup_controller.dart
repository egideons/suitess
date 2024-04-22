import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/src/controllers/api_processor_controller.dart';

import '../../app/auth/email_otp/screen/email_otp.dart';
import '../../app/auth/login/screen/login.dart';
import '../constants/consts.dart';

class SignupController extends GetxController {
  static SignupController get instance {
    return Get.find<SignupController>();
  }

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
  final firstNameEC = TextEditingController();
  final lastNameEC = TextEditingController();
  final emailEC = TextEditingController();
  final phoneNumberEC = TextEditingController();
  final passwordEC = TextEditingController();

  //=========== Focus nodes ===========\\
  final firstNameFN = FocusNode();
  final lastNameFN = FocusNode();
  final emailFN = FocusNode();
  final phoneNumberFN = FocusNode();
  final passwordFN = FocusNode();

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var isFirstNameValid = false.obs;
  var isLastNameValid = false.obs;
  var isEmailValid = false.obs;
  var isPhoneNumberValid = false.obs;
  var isPasswordValid = false.obs;
  var passwordIsHidden = true.obs;
  var formIsValid = false.obs;

  var responseStatus = 0.obs;
  var responseMessage = "".obs;
  var ngnDialCode = "+234".obs;

  //=========== onChanged Functions ===========\\
  firstNameOnChanged(value) {
    var userNameRegExp = RegExp(userNamePattern);
    if (!userNameRegExp.hasMatch(firstNameEC.text)) {
      isFirstNameValid.value = false;
    } else {
      isFirstNameValid.value = true;
    }
    update();
  }

  lastNameOnChanged(value) {
    var userNameRegExp = RegExp(userNamePattern);
    if (isFirstNameValid.isTrue) {
      if (!userNameRegExp.hasMatch(lastNameEC.text)) {
        isLastNameValid.value = false;
      } else {
        isLastNameValid.value = true;
      }
    } else {
      isLastNameValid.value = false;
    }
    update();
  }

  emailOnChanged(value) {
    var emailRegExp = RegExp(emailPattern);
    if (isLastNameValid.isTrue) {
      if (!emailRegExp.hasMatch(emailEC.text)) {
        isEmailValid.value = false;
      } else {
        isEmailValid.value = true;
      }
    } else {
      isEmailValid.value = false;
    }
    update();
  }

  phoneNumberOnChanged(value) {
    var phoneNumberRegExp = RegExp(mobilePattern);
    if (isEmailValid.isTrue) {
      if (!phoneNumberRegExp.hasMatch(phoneNumberEC.text)) {
        isPhoneNumberValid.value = false;
      } else {
        isPhoneNumberValid.value = true;
      }
    } else {
      isPhoneNumberValid.value = false;
    }
    update();
  }

  passwordOnChanged(value) {
    var passwordRegExp = RegExp(passwordPattern);
    if (isPhoneNumberValid.isTrue) {
      if (!passwordRegExp.hasMatch(passwordEC.text)) {
        isPasswordValid.value = false;
        setFormIsInvalid();
      } else {
        isPasswordValid.value = true;
        setFormIsValid();
        update();
      }
    } else {
      isPasswordValid.value = false;
      setFormIsInvalid();
    }
    update();
  }

  setFormIsValid() {
    formIsValid.value = true;
  }

  setFormIsInvalid() {
    formIsValid.value = false;
  }

  //=========== Signup Methods ===========\\
  onSubmitted(value) {
    if (formIsValid.isTrue) {
      signup();
    }
  }

  Future<void> signup() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      isLoading.value = true;
      update();

      await Future.delayed(const Duration(seconds: 3));

      ApiProcessorController.successSnack("Signup successful");

      Get.offAll(
        () => const EmailOTP(),
        routeName: "/email-otp",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
      );
    }
    isLoading.value = false;
    update();
  }

  Future<void> signupWithGoogle() async {}

  //=========== Navigate to Login ===========\\
  navigateToLogin() {
    // Navigate to Home() screen
    Get.offAll(
      () => const Login(),
      routeName: "/login",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }
}
