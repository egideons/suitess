import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/app/auth/otp/widgets/ios/otp_cupertino_scaffold.dart';
import 'package:kribb/src/controllers/signup_controller.dart';

class OTP extends StatelessWidget {
  const OTP({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(SignupController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const OTPCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const Scaffold(),
    );
  }
}
