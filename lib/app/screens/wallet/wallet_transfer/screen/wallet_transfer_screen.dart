import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/app/wallet_transfer_controller.dart';
import '../platform/android/wallet_transfer_scaffold.dart';

class WalletTransferScreen extends StatelessWidget {
  const WalletTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(WalletTransferController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const WalletTransferScaffold(),
    );
  }
}
