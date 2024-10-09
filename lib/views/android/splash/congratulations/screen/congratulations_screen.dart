// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/others/congratulations_splash_screen_controller.dart';
import 'package:suitess/views/android/splash/congratulations/content/android_congratulations_splash_scaffold.dart';

class AndroidCongratulationsSplashScreen extends StatelessWidget {
  const AndroidCongratulationsSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize controller
    Get.put(CongratulationsSplashScreenController());

    return GetBuilder<CongratulationsSplashScreenController>(
      init: CongratulationsSplashScreenController(),
      builder: (controller) {
        return const AndroidCongratulationsSplashScaffold();
      },
    );
  }
}
