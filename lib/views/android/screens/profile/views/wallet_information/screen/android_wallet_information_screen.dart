import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controllers/app/wallet_information_controller.dart';
import '../content/android_wallet_information_scaffold.dart';

class AndroidWalletInformationScreen extends StatelessWidget {
  const AndroidWalletInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(WalletInformationController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidWalletInformationScaffold(),
    );
  }
}
