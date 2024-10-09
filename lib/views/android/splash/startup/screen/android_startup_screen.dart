// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/auth/auth_controller.dart';
import '../content/android_startup_scaffold.dart';

class AndroidStartupScreen extends StatelessWidget {
  const AndroidStartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize controller
    Get.put(AuthController());

    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return const AndroidStartupScaffold();
      },
    );
  }
}
