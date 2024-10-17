import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/auth/edit_contact_phone_otp_controller.dart';

import '../content/android_edit_contact_phone_otp_scaffold.dart';

class AndroidEditContactPhoneOtpScreen extends StatelessWidget {
  final String? userPhoneNumber, userEmail;
  const AndroidEditContactPhoneOtpScreen(
      {super.key, this.userPhoneNumber, this.userEmail});

  @override
  Widget build(BuildContext context) {
    //Initialize otp controller
    Get.put(EditContactPhoneOtpController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const EditContactPhoneOTPCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: AndroidEditContactPhoneOtpScaffold(
        userPhoneNumber: userPhoneNumber!,
        userEmail: userEmail!,
      ),
    );
  }
}
