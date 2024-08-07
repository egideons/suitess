import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/app/checkout_property_controller.dart';
import '../platform/android/checkout_property_scaffold.dart';

class CheckoutPropertyScreen extends StatelessWidget {
  final String? paymentMethod;
  const CheckoutPropertyScreen({super.key, this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(CheckoutPropertyController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: CheckoutPropertyScaffold(paymentMethod: paymentMethod),
    );
  }
}
