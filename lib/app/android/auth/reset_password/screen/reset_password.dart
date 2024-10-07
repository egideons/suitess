import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/android/auth/reset_password/plaftorm/ios/reset_password_cupertino_scaffold.dart';
import 'package:suitess/src/controllers/auth/reset_password_controller.dart';

import '../plaftorm/android/reset_password_scaffold.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize otp controller
    Get.put(ResetPasswordController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const ResetPasswordCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const ResetPasswordScaffold(),
    );
  }
}
