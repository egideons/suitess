import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/app/onboarding/model/onboard_content.dart';

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
  var onboardController = OnboardContent().obs;

  var isLastPage = false.obs;

  setIsLastPage(index) {
    isLastPage.value = onboardController.value.items.length - 1 == index;

    log("This is the last page: $isLastPage");
  }
}
