import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/landlord/landlord_notifications_controller.dart';
import '../widgets/android/landlord_notifications_scaffold.dart';
import '../widgets/ios/landlord_notifications_cupertino_scaffold.dart';

class LandLordNotifications extends StatelessWidget {
  const LandLordNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(LandLordNotificationsController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const LandLordNotificationsCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const LandLordNotificationsScaffold(),
    );
  }
}
