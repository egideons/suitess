import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/auth/forgot_password_via_email_controller.dart';
import '../widget/android/forgot_password_via_email_scaffold.dart';

class ForgotPasswordViaEmail extends StatelessWidget {
  const ForgotPasswordViaEmail({super.key});
  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(ForgotPasswordViaEmailController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const ForgotPasswordCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const ForgotPasswordViaEmailScaffold(),
    );
  }
}
