import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/others/onboarding_controller.dart';
import '../platform/android/onboarding_android_scaffold.dart';
import '../platform/ios/onboarding_cupertino_scaffold.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize controller
    Get.put(OnboardingController());

    if (Platform.isIOS) {
      return const OnboardingCupertinoScaffold();
    }
    return const OnboardingAndroidScaffold();
  }
}
