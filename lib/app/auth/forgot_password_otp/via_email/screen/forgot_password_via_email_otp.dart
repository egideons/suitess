import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/auth/forgot_password_otp/via_email/widgets/ios/forgot_password_via_email_otp_cupertino_scaffold.dart';
import 'package:suitess/src/controllers/auth/forgot_password_via_email_otp_controller.dart';

import '../widgets/android/forgot_password_via_email_otp_scaffold.dart';

class ForgotPasswordViaEmailOTP extends StatelessWidget {
  const ForgotPasswordViaEmailOTP({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(ForgotPasswordViaEmailOtpController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const ForgotPasswordViaEmailOTPCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const ForgotPasswordViaEmailOTPScaffold(),
    );
  }
}
