import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/app/success_screen_controller.dart';
import '../platform/android/success_scaffold.dart';

class SuccessScreen extends StatelessWidget {
  final String? subtitle;
  final bool? isWalletTab;
  const SuccessScreen({super.key, this.subtitle, this.isWalletTab});

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
      child: SuccessScaffold(
        subtitle: subtitle,
        isWalletTab: isWalletTab ?? false,
      ),
    );
  }
}
