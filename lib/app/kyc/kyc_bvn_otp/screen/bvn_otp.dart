import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/src/controllers/kyc_bvn_otp_controller.dart';

import '../widgets/ios/bvn_otp_cupertino_scaffold.dart';

class BvnOTP extends StatelessWidget {
  const BvnOTP({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize otp controller
    Get.put(BvnOTPController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const BvnOTPCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const Scaffold(),
    );
  }
}
