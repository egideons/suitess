import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/auth/signup/screen/signup.dart';

import '../../../app/onboarding/screen/onboarding.dart';
import '../../../main.dart';

class AuthController extends GetxController {
  static AuthController get instance {
    return Get.find<AuthController>();
  }

  var isLoading = false.obs;

  var responseStatus = 0.obs;
  var responseMessage = "".obs;

  @override
  void onInit() {
    Timer(const Duration(seconds: 2), () {
      loadApp();
    });
    super.onInit();
  }

  Future<void> loadApp() async {
    bool isOnboarded = prefs.getBool("isOnboarded") ?? false;

    if (isOnboarded) {
      await Get.offAll(
        () => const Signup(),
        routeName: "/signup",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
      );
    }

    await Get.offAll(
      () => const Onboarding(),
      routeName: "/onboarding",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }
}
