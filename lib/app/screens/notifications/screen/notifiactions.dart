import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../src/controllers/app/notifications_controller.dart';
import '../widgets/android/notifications_scaffold.dart';
import '../widgets/ios/notifications_cupertino_scaffold.dart';

class LandLordNotifications extends StatelessWidget {
  const LandLordNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(NotificationsController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const NotificationsCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const NotificationsScaffold(),
    );
  }
}
