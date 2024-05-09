import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../src/controllers/landlord_notifications_controller.dart';

class LandLordNotificationsScaffold
    extends GetView<LandLordNotificationsController> {
  const LandLordNotificationsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    // var colorScheme = Theme.of(context).colorScheme;

    // var controller = LandLordNotificationsController.instance;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [],
      ),
    );
  }
}
