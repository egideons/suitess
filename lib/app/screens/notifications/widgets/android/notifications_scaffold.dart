import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/app/notifications_controller.dart';

class NotificationsScaffold extends GetView<NotificationsController> {
  const NotificationsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    // var controller = NotificationsController.instance;

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
