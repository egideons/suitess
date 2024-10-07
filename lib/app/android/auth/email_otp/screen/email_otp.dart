import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/auth/email_otp_controller.dart';
import '../platform/android/email_otp_scaffold.dart';
import '../platform/ios/email_otp_cupertino_scaffold.dart';

class EmailOTP extends StatelessWidget {
  const EmailOTP({super.key, this.userEmail, this.userPhoneNumber});

  final String? userEmail, userPhoneNumber;

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
      child: EmailOTPScaffold(
        userEmail: userEmail!,
        userPhoneNumber: userPhoneNumber!,
      ),
    );
  }
}
