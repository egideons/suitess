import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/onboarding/screen/onboarding.dart';

class AuthController extends GetxController {
  static AuthController get instance {
    return Get.find<AuthController>();
  }

  var isLoading = false.obs;
  var isResendingOTP = false.obs;

  var responseStatus = 0.obs;
  var responseMessage = "".obs;

  @override
  void onInit() {
    Timer(const Duration(seconds: 2), () async {
      await Get.offAll(
        () => const Onboarding(),
        routeName: "onboarding",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
      );
    });
    super.onInit();
  }
}
