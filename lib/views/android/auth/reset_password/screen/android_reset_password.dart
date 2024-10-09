import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/auth/reset_password_controller.dart';

import '../content/android_reset_password_scaffold.dart';

class AndroidResetPassword extends StatelessWidget {
  const AndroidResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize otp controller
    Get.put(ResetPasswordController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidResetPasswordScaffold(),
    );
  }
}
