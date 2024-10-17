import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controllers/app/checkout_property_controller.dart';
import '../content/android_checkout_property_scaffold.dart';

class AndroidCheckoutPropertyScreen extends StatelessWidget {
  final String? androidPaymentMethod;
  const AndroidCheckoutPropertyScreen({super.key, this.androidPaymentMethod});

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
      child: AndroidCheckoutPropertyScaffold(
          androidPaymentMethod: androidPaymentMethod),
    );
  }
}
