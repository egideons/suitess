import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/screens/home/platform/android/home_screen_scaffold.dart';
import 'package:suitess/src/controllers/app/homescreen_controller.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(HomeScreenController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const HomeScreenScaffold(),
    );
  }
}
