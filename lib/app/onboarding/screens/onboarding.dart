import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/onboarding_page_controller.dart';
import '../widgets/android/android_scaffold.dart';
import '../widgets/ios/cupertino_scaffold.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the page controller
    var onboardingController = Get.put(OnboardingController());

    if (Platform.isIOS) {
      return CupertinoOnboardingScaffold(
        pageController: onboardingController.pageController.value,
      );
    }
    return const AndroidOnboardingScaffold();
  }
}
