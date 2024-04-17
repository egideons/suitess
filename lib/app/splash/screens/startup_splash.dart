// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/app/onboarding/screens/onboarding.dart';

import '../widgets/android/android_scaffold.dart';
import '../widgets/ios/cupertino_page_scaffold.dart';

class StartupSplashscreen extends StatelessWidget {
  const StartupSplashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    Future.delayed(
      const Duration(seconds: 3),
      () async {
        await Get.offAll(
          () => const Onboarding(),
          routeName: "onboarding",
          fullscreenDialog: true,
          curve: Curves.easeInOut,
          predicate: (routes) => false,
          popGesture: false,
          duration: const Duration(milliseconds: 500),
          transition: Get.defaultTransition,
        );
      },
    );
    if (Platform.isIOS) {
      return IOSScaffold(media: media);
    }
    return AndroidScaffold(media: media);
  }
}
