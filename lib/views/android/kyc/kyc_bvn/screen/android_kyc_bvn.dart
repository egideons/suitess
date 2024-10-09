import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/kyc/kyc_bvn_controller.dart';
import '../content/android_kyc_bvn_scaffold.dart';

class AndroidKycBvnScreen extends StatelessWidget {
  const AndroidKycBvnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize otp controller
    Get.put(KycBvnController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidKycBvnScaffold(),
    );
  }
}
