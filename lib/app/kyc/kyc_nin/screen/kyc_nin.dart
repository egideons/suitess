import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../src/controllers/kyc_nin_controller.dart';
import '../widgets/ios/kyc_nin_cupertino_scaffold.dart';

class KycNIN extends StatelessWidget {
  const KycNIN({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize otp controller
    Get.put(KycNINController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const KycNinCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const Scaffold(),
    );
  }
}
