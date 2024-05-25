import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/onboarding/model/onboard_content.dart';

import '../../../app/auth/signup/screen/signup.dart';
import '../../../main.dart';

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

  getStarted() async {
    //Save state that the user has been onboarded
    prefs.setBool("isOnboarded", true);

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
}
