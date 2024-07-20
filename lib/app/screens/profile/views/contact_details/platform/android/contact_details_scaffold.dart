import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../src/controllers/app/contact_details_controller.dart';

class ContactDetailsScaffold extends GetView<ContactDetailsScreenController> {
  const ContactDetailsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    // var controller = ProfileScreenController.instance;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Scrollbar(
          controller: controller.scrollController,
          child: GetBuilder<ContactDetailsScreenController>(
            init: ContactDetailsScreenController(),
            builder: (controller) {
              return ListView(
                controller: controller.scrollController,
                padding: const EdgeInsets.all(10),
                physics: const BouncingScrollPhysics(),
                children: const [],
              );
            },
          ),
        ),
      ),
    );
  }
}
