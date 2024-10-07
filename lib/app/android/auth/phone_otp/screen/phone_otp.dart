import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/android/auth/phone_otp/platform/ios/phone_otp_cupertino_scaffold.dart';
import 'package:suitess/src/controllers/auth/phone_otp_controller.dart';

import '../platform/android/phone_otp_scaffold.dart';

class PhoneOTP extends StatelessWidget {
  final String? userPhoneNumber, userEmail;
  const PhoneOTP({super.key, this.userPhoneNumber, this.userEmail});

  @override
  Widget build(BuildContext context) {
    //Initialize otp controller
    Get.put(PhoneOTPController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const PhoneOTPCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: PhoneOTPScaffold(
        userPhoneNumber: userPhoneNumber!,
        userEmail: userEmail!,
      ),
    );
  }
}
