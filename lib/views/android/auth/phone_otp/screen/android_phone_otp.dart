import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/auth/phone_otp_controller.dart';

import '../content/android_phone_otp_scaffold.dart';

class AndroidPhoneOTPScreen extends StatelessWidget {
  final String? userPhoneNumber, userEmail;
  const AndroidPhoneOTPScreen(
      {super.key, this.userPhoneNumber, this.userEmail});

  @override
  Widget build(BuildContext context) {
    //Initialize otp controller
    Get.put(PhoneOTPController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: AndroidPhoneOTPScaffold(
        userPhoneNumber: userPhoneNumber!,
        userEmail: userEmail!,
      ),
    );
  }
}
