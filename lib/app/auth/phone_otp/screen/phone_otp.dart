import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/auth/phone_otp/widgets/ios/phone_otp_cupertino_scaffold.dart';
import 'package:suitess/src/controllers/auth/phone_otp_controller.dart';

import '../widgets/android/phone_otp_scaffold.dart';

class PhoneOTP extends StatelessWidget {
  const PhoneOTP({super.key});

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
      child: const PhoneOTPScaffold(),
    );
  }
}
