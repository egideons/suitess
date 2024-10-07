import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/android/screens/wallet/reset_tx_pin_options/via_email/platform/android/reset_tx_pin_via_email_scaffold.dart';
import 'package:suitess/src/controllers/app/reset_tx_pin_via_email_controller.dart';

class ResetTxPinViaEmail extends StatelessWidget {
  const ResetTxPinViaEmail({super.key});
  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(ResetTxPinViaEmailController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const ResetPasswordViaEmailCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const ResetTxPinViaEmailScaffold(),
    );
  }
}
