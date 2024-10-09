import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../src/controllers/auth/reset_password_via_sms_controller.dart';
import '../content/android_reset_password_via_sms_scaffold.dart';

class AndroidResetPasswordViaSMS extends StatelessWidget {
  const AndroidResetPasswordViaSMS({super.key});
  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(ResetPasswordViaSMSController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const ResetPasswordViaSMSCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidResetPasswordViaSMSScaffold(),
    );
  }
}
