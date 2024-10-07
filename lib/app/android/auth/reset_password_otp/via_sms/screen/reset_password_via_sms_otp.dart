import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../src/controllers/auth/reset_password_via_sms_otp_controller.dart';
import '../platform/android/reset_password_via_sms_otp_scaffold.dart';
import '../platform/ios/reset_password_via_sms_otp_cupertino_scaffold.dart';

class ResetPasswordViaSMSOTP extends StatelessWidget {
  final String? userPhoneNumber;
  const ResetPasswordViaSMSOTP({super.key, this.userPhoneNumber});

  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(ResetPasswordViaSmsOTPController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const ResetPasswordViaSMSOTPCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: ResetPasswordViaSMSOTPScaffold(
        userPhoneNumber: userPhoneNumber!,
      ),
    );
  }
}
