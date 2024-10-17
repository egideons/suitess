import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controllers/app/support_and_feedback_controller.dart';
import '../content/android_support_and_feedback_scaffold.dart';

class AndroidSupportAndFeedbackScreen extends StatelessWidget {
  const AndroidSupportAndFeedbackScreen({super.key});

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
      child: const AndroidSupportAndFeedbackScaffold(),
    );
  }
}
