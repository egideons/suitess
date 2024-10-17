import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controllers/app/wallet_screen_controller.dart';
import '../content/android_wallet_scaffold.dart';

class AndroidWalletScreen extends StatelessWidget {
  const AndroidWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(WalletScreenController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidWalletScaffold(),
    );
  }
}
