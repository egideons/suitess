import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controllers/app/notifications_settings_controller.dart';
import '../content/android_notifications_settings_scaffold.dart';

class AndroidNotificationsSettingsScreen extends StatelessWidget {
  const AndroidNotificationsSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(NotificationsSettingsController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidNotificationsSettingsScaffold(),
    );
  }
}
