import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controllers/app/wallet_transfer_controller.dart';
import '../content/android_wallet_transfer_scaffold.dart';

class AndroidWalletTransferScreen extends StatelessWidget {
  const AndroidWalletTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(WalletTransferController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidWalletTransferScaffold(),
    );
  }
}
