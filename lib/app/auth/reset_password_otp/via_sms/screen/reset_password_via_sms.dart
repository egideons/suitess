import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/auth/reset_password_via_sms_otp_controller.dart';
import '../widgets/android/reset_password_via_sms_scaffold.dart';
import '../widgets/ios/reset_password_via_sms_cupertino_scaffold.dart';

class ResetPasswordViaSMSOTP extends StatelessWidget {
  const ResetPasswordViaSMSOTP({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(ResetPasswordViaSMSOtpController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const ResetPasswordViaSMSOTPCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const ForgotPasswordViaSMSOTPScaffold(),
    );
  }
}
