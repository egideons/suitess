import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controllers/app/purchase_property_controller.dart';
import '../platform/android/purchase_property_scaffold.dart';

class PurchasePropertyScreen extends StatelessWidget {
  const PurchasePropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(PurchasePropertyController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const PurchasePropertyScaffold(),
    );
  }
}
