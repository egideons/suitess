import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controllers/app/support_and_feedback_controller.dart';
import '../platform/android/support_and_feedback_scaffold.dart';

class SupportAndFeedbackScreen extends StatelessWidget {
  const SupportAndFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(SupportAndFeedbackController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const SupportAndFeedbackScaffold(),
    );
  }
}
