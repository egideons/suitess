import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/auth/reset_password_via_email_otp_controller.dart';

import '../content/android_reset_password_via_email_otp_scaffold.dart';

class AndroidResetPasswordViaEmailOTP extends StatelessWidget {
  final String? userEmail;
  const AndroidResetPasswordViaEmailOTP({super.key, this.userEmail});

  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(ResetPasswordViaEmailOTPController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: AndroidResetPasswordViaEmailOTPScaffold(userEmail: userEmail!),
    );
  }
}
