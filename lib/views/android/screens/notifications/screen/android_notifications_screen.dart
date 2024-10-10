import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/app/notifications_controller.dart';
import '../content/android_notifications_scaffold.dart';

class AndroidNotificationsScreen extends StatelessWidget {
  const AndroidNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(NotificationsController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidNotificationsScaffold(),
    );
  }
}
