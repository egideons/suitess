import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controllers/app/purchase_property_controller.dart';
import '../content/android_purchase_property_scaffold.dart';

class AndroidPurchasePropertyScreen extends StatelessWidget {
  const AndroidPurchasePropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(PurchasePropertyController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidPurchasePropertyScaffold(),
    );
  }
}
