import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/views/android/screens/messages/content/android_messages_screen_scaffold.dart';

import '../../../../../controllers/app/messages_controller.dart';

class AndroidMessagesScreen extends StatelessWidget {
  const AndroidMessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(MessagesController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const MessagesScreenScaffold(),
    );
  }
}
