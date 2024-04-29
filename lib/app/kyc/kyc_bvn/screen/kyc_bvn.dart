import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../src/controllers/kyc_bvn_controller.dart';
import '../widgets/android/kyc_bvn_scaffold.dart';
import '../widgets/ios/kyc_bvn_cupertino_scaffold.dart';

class KycBvn extends StatelessWidget {
  const KycBvn({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize otp controller
    Get.put(KycBvnController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const KycBvnCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const KycBvnScaffold(),
    );
  }
}
