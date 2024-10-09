import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/auth/email_otp_controller.dart';
import '../content/android_email_otp_scaffold.dart';

class AndroidEmailOTP extends StatelessWidget {
  const AndroidEmailOTP({super.key, this.userEmail, this.userPhoneNumber});

  final String? userEmail, userPhoneNumber;

  @override
  Widget build(BuildContext context) {
    //Initialize otp controller
    Get.put(EmailOTPController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: AndroidEmailOTPScaffold(
        userEmail: userEmail!,
        userPhoneNumber: userPhoneNumber!,
      ),
    );
  }
}
