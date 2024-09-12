import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/app/airtime_controller.dart';
import '../platform/android/airtime_purchase_scaffold.dart';

class AirtimePurchaseScreen extends StatelessWidget {
  const AirtimePurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(AirtimePurchaseController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AirtimePurchaseScaffold(),
    );
  }
}