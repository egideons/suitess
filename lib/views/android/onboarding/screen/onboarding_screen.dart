import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/others/onboarding_controller.dart';
import '../content/android_onboarding_scaffold.dart';

class AndroidOnboardingScreen extends StatelessWidget {
  const AndroidOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize controller
    Get.put(OnboardingController());

    return const AndroidOnboardingScaffold();
  }
}
