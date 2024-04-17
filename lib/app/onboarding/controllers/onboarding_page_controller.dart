import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPageController extends GetxController {
  static OnboardingPageController get instance {
    return Get.find<OnboardingPageController>();
  }

  var isLoading = false.obs;
  var isResendingOTP = false.obs;

  var responseStatus = 0.obs;
  var responseMessage = "".obs;

  var scrollController = ScrollController().obs;
  var pageController = PageController().obs;
}
