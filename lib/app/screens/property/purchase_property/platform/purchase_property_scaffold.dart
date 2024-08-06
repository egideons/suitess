import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/app/purchase_property_controller.dart';

class PurchasePropertyScaffold extends GetView<PurchasePropertyController> {
  const PurchasePropertyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Scrollbar(
          child: ListView(
            controller: controller.scrollController,
            children: [
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
