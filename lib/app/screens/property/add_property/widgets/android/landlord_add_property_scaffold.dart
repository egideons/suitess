import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../src/controllers/app/landlord_add_property_controller.dart';

class LandLordAddPropertyScaffold
    extends GetView<LandLordAddPropertyController> {
  const LandLordAddPropertyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    // var controller = LandLordAddPropertyController.instance;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [],
      ),
    );
  }
}
