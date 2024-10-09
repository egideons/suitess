import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/kyc/kyc_bvn_otp_controller.dart';

import '../content/android_kyc_bvn_otp_scaffold.dart';

class AndroidKycBvnOTPScreen extends StatelessWidget {
  const AndroidKycBvnOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize otp controller
    Get.put(KycBvnOTPController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidKycBvnOTPScaffold(),
    );
  }
}
