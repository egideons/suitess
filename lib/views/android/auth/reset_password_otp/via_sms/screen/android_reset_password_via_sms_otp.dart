import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../src/controllers/auth/reset_password_via_sms_otp_controller.dart';
import '../content/android_reset_password_via_sms_otp_scaffold.dart';

class AndroidResetPasswordViaSMSOTP extends StatelessWidget {
  final String? userPhoneNumber;
  const AndroidResetPasswordViaSMSOTP({super.key, this.userPhoneNumber});

  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(ResetPasswordViaSmsOTPController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: AndroidResetPasswordViaSMSOTPScaffold(
        userPhoneNumber: userPhoneNumber!,
      ),
    );
  }
}
