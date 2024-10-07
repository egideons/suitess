import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/android/auth/reset_password_otp/via_email/platform/ios/reset_password_via_email_otp_cupertino_scaffold.dart';
import 'package:suitess/src/controllers/auth/reset_password_via_email_otp_controller.dart';

import '../platform/android/reset_password_via_email_otp_scaffold.dart';

class ResetPasswordViaEmailOTP extends StatelessWidget {
  final String? userEmail;
  const ResetPasswordViaEmailOTP({super.key, this.userEmail});

  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(ResetPasswordViaEmailOTPController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const ResetPasswordViaEmailOTPCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: ResetPasswordViaEmailOTPScaffold(userEmail: userEmail!),
    );
  }
}
