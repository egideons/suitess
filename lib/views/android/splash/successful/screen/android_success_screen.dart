import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/app/success_screen_controller.dart';
import '../content/android_success_scaffold.dart';

class AndroidSuccessScreen extends StatelessWidget {
  final String? subtitle;
  final bool? isWalletTab;
  const AndroidSuccessScreen({super.key, this.subtitle, this.isWalletTab});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(SuccessScreenController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: AndroidSuccessScaffold(
        subtitle: subtitle,
        isWalletTab: isWalletTab ?? false,
      ),
    );
  }
}
