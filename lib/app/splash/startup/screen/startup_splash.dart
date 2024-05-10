// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../src/controllers/auth/auth_controller.dart';
import '../widgets/android/splash_android_scaffold.dart';
import '../widgets/ios/splash_cupertino_scaffold.dart';

class StartupSplashscreen extends StatelessWidget {
  const StartupSplashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize controller
    Get.put(AuthController());

    if (Platform.isIOS) {
      return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return const SplashCupertinoScaffold();
        },
      );
    }
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return const SplashAndroidScaffold();
      },
    );
  }
}
