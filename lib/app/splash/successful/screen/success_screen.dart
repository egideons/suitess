import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../src/controllers/app/success_screen_controller.dart';
import '../platform/android/success_scaffold.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(SuccessScreenController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const SuccessScaffold(),
    );
  }
}
