import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/app/auth/email_otp/widgets/ios/email_otp_cupertino_scaffold.dart';
import 'package:kribb/src/controllers/auth/email_otp_controller.dart';

import '../widgets/android/email_otp_scaffold.dart';

class EmailOTP extends StatelessWidget {
  const EmailOTP({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize otp controller
    Get.put(EmailOTPController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const EmailOTPCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const EmailOTPScaffold(),
    );
  }
}
