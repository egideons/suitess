import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/app/chat_controller.dart';
import '../content/android_chat_screen_scaffold.dart';

class AndroidChatScreen extends StatelessWidget {
  final String? userName;
  const AndroidChatScreen({super.key, this.userName});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(ChatController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: AndroidChatScreenScaffold(userName: userName),
    );
  }
}
