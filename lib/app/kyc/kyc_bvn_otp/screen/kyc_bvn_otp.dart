import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/src/controllers/kyc/kyc_bvn_otp_controller.dart';

import '../widgets/android/kyc_bvn_otp_scaffold.dart';
import '../widgets/ios/kyc_bvn_otp_cupertino_scaffold.dart';

class KycBvnOTP extends StatelessWidget {
  const KycBvnOTP({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize otp controller
    Get.put(KycBvnOTPController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const KycBvnOTPCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const KycBvnOTPScaffold(),
    );
  }
}
