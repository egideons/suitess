import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../src/controllers/app/bank_transfer_controller.dart';
import '../platform/android/bank_transfer_scaffold.dart';

class BankTransferScreen extends StatelessWidget {
  const BankTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(BankTransferController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const BankTransferScaffold(),
    );
  }
}
