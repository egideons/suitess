import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/onboarding/model/onboard_content.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance {
    return Get.find<OnboardingController>();
  }

  var scrollController = ScrollController().obs;
  var pageController = PageController().obs;
  var onboardController = OnboardContent().obs;

  var isLastPage = false.obs;

  setIsLastPage(index) {
    isLastPage.value = onboardController.value.items.length - 1 == index;
  }
}
