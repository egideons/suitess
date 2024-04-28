import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/app/auth/forgot_password_otp/via_email/widgets/ios/forgot_password_via_email_otp_cupertino_scaffold.dart';

import '../../../../../src/controllers/forgot_password_via_sms.dart';

class ForgotPasswordViaSMSOTP extends StatelessWidget {
  const ForgotPasswordViaSMSOTP({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(ForgotPasswordViaSMSOtpController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const ForgotPasswordViaEmailOTPCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const Scaffold(),
    );
  }
}
