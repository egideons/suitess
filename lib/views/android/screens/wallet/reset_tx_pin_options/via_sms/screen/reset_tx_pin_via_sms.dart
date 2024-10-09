import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/app/reset_tx_pin_via_sms_controller.dart';

import '../platform/android/reset_tx_pin_via_sms_scaffold.dart';

class ResetTxPinViaSms extends StatelessWidget {
  const ResetTxPinViaSms({super.key});
  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(ResetTxPinViaSmsController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const ResetPasswordViaSMSCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const ResetTxPinViaSmsScaffold(),
    );
  }
}
