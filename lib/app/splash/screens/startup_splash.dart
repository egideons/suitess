// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../src/controllers/auth_controller.dart';
import '../widgets/android/android_scaffold.dart';
import '../widgets/ios/cupertino_page_scaffold.dart';

class StartupSplashscreen extends StatelessWidget {
  const StartupSplashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    //Initialize controller
    Get.put(AuthController());

    if (Platform.isIOS) {
      return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return IOSScaffold(media: media);
        },
      );
    }
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return AndroidScaffold(media: media);
      },
    );
  }
}
