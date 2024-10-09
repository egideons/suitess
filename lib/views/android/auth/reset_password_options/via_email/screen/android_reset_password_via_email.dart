import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controllers/auth/reset_password_via_email_controller.dart';
import '../content/android_reset_password_via_email_scaffold.dart';

class AndroidResetPasswordViaEmailScreen extends StatelessWidget {
  const AndroidResetPasswordViaEmailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(ResetPasswordViaEmailController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const ResetPasswordViaEmailCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidResetPasswordViaEmailScaffold(),
    );
  }
}
