import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/kyc/kyc_nin_controller.dart';
import '../content/android_kyc_nin_scaffold.dart';

class AndroidKycNINScreen extends StatelessWidget {
  const AndroidKycNINScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize otp controller
    Get.put(KycNINController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidKycNinScaffold(),
    );
  }
}
