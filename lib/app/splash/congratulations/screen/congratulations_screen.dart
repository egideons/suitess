// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/splash/congratulations/platform/android/congratulations_splash_screen_android_scaffold.dart';
import 'package:suitess/src/controllers/others/congratulations_splash_screen_controller.dart';

import '../platform/ios/congratulations_splash_screen_cupertino_scaffold.dart';

class CongratulationsSplashScreen extends StatelessWidget {
  const CongratulationsSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize controller
    Get.put(CongratulationsSplashScreenController());

    if (Platform.isIOS) {
      return GetBuilder<CongratulationsSplashScreenController>(
        init: CongratulationsSplashScreenController(),
        builder: (controller) {
          return const CongratulationsSplashScreenCupertinoScaffold();
        },
      );
    }
    return GetBuilder<CongratulationsSplashScreenController>(
      init: CongratulationsSplashScreenController(),
      builder: (controller) {
        return const CongratulationsSplashScreenAndroidScaffold();
      },
    );
  }
}
