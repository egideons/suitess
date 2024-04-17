import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance {
    return Get.find<OnboardingController>();
  }

  var isLoading = false.obs;
  var isResendingOTP = false.obs;

  var responseStatus = 0.obs;
  var responseMessage = "".obs;

  var scrollController = ScrollController().obs;
  var pageController = PageController().obs;
}
