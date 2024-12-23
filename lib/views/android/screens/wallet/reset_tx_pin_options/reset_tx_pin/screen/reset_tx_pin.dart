import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/app/reset_tx_pin_controller.dart';
import 'package:suitess/views/android/screens/wallet/reset_tx_pin_options/reset_tx_pin/platform/android/reset_tx_pin_scaffold.dart';

class ResetTxPin extends StatelessWidget {
  const ResetTxPin({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(ResetTxPinController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const ResetPasswordViaEmailOTPCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const ResetTxPinScaffold(),
    );
  }
}
