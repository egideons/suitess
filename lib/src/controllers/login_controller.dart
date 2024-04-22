import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/auth/signup/screen/signup.dart';
import '../constants/consts.dart';

class LoginController extends GetxController {
  static LoginController get instance {
    return Get.find<LoginController>();
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
  var isEmailValid = false.obs;
  var isPasswordValid = false.obs;
  var passwordIsHidden = true.obs;
  var formIsValid = false.obs;

  var responseStatus = 0.obs;
  var responseMessage = "".obs;

  //=========== onChanged Functions ===========\\

  emailOnChanged(value) {
    var emailRegExp = RegExp(emailPattern);
    if (!emailRegExp.hasMatch(emailEC.text)) {
      isEmailValid.value = false;
    } else {
      isEmailValid.value = true;
    }

    update();
  }

  passwordOnChanged(value) {
    var passwordRegExp = RegExp(passwordPattern);
    if (isEmailValid.isTrue) {
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

  //=========== Login Methods ===========\\
  onSubmitted(value) {
    if (formIsValid.isTrue) {
      login();
    }
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      isLoading.value = true;
      update();

      log("Logging in");
      await Future.delayed(const Duration(seconds: 3));
    }
    isLoading.value = false;
    update();
  }

  Future<void> loginWithGoogle() async {}

  navigateToSignup() {
    // Navigate to Home() screen
    Get.offAll(
      () => const Signup(),
      routeName: "/signup",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }
}
