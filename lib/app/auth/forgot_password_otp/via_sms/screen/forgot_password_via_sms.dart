import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/forgot_password_via_sms_controller.dart';
import '../widgets/android/forgot_password_via_sms_scaffold.dart';
import '../widgets/ios/forgot_password_via_sms_cupertino_scaffold.dart';

class ForgotPasswordViaSMSOTP extends StatelessWidget {
  const ForgotPasswordViaSMSOTP({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(ForgotPasswordViaSMSOtpController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const ForgotPasswordViaSMSOTPCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const ForgotPasswordViaSMSOTPScaffold(),
    );
  }
}
