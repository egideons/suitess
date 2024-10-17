import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controllers/app/password_settings_controller.dart';
import '../content/android_password_settings_scaffold.dart';

class AndroidPasswordSettingsScreen extends StatelessWidget {
  const AndroidPasswordSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(PasswordSettingsController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidPasswordSettingsScaffold(),
    );
  }
}
