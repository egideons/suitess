import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/auth/login/login.dart';
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

  //=========== onChanged String Functions ===========\\
  firstNameOnChanged(value) {
    var userNameRegExp = RegExp(userNamePattern);
    if (!userNameRegExp.hasMatch(firstNameEC.text)) {
      isFirstNameValid.value = false;
    } else {
      isFirstNameValid.value = true;
    }
  }

  lastNameOnChanged(value) {
    var userNameRegExp = RegExp(userNamePattern);
    if (!userNameRegExp.hasMatch(lastNameEC.text)) {
      isLastNameValid.value = false;
    } else {
      isLastNameValid.value = true;
    }
  }

  emailOnChanged(value) {
    var emailRegExp = RegExp(emailPattern);
    if (!emailRegExp.hasMatch(emailEC.text)) {
      isEmailValid.value = false;
    } else {
      isEmailValid.value = true;
    }
  }

  phoneNumberOnChanged(value) {
    var phoneNumberRegExp = RegExp(phoneNumberPattern);
    if (!phoneNumberRegExp.hasMatch(emailEC.text)) {
      isPhoneNumberValid.value = false;
    } else {
      isPhoneNumberValid.value = true;
    }
  }

  passwordOnChanged(value) {
    var passwordRegExp = RegExp(passwordPattern);
    if (!passwordRegExp.hasMatch(passwordEC.text)) {
      isPasswordValid.value = false;
    } else {
      isPasswordValid.value = true;
    }
  }

  setFormIsValid() {
    if (isFirstNameValid.isTrue &&
        isLastNameValid.isTrue &&
        isEmailValid.isTrue &&
        isPhoneNumberValid.isTrue &&
        isPasswordValid.isTrue) {
      formIsValid.value = true;
    }
    formIsValid.value = false;
  }

  //=========== Signup Methods ===========\\
  Future<void> signup() async {
    isLoading.value = true;
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
