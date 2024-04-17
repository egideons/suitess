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
    //Put the onboardingController
    final controller = Get.put(OnboardingController());

    if (Platform.isIOS) {
      return CupertinoOnboardingScaffold(controller: controller);
    }
    return AndroidOnboardingScaffold(controller: controller);
  }
}
