import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controllers/app/privacy_and_security_controller.dart';
import '../content/android_privacy_and_security_scaffold.dart';

class AndroidPrivacyAndSecurityScreen extends StatelessWidget {
  const AndroidPrivacyAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(PrivacyAndSecurityController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidPrivacyAndSecurityScaffold(),
    );
  }
}
