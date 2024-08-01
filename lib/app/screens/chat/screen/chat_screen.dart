import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../src/controllers/app/chat_controller.dart';
import '../platform/android/chat_screen_scaffold.dart';

class ChatScreen extends StatelessWidget {
  final String? userName;
  const ChatScreen({super.key, this.userName});

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
      child: ChatScreenScaffold(userName: userName),
    );
  }
}
