import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/controllers/app/landlord_view_property_controller.dart';

class ViewPropertyScaffold extends GetView<ViewPropertyController> {
  const ViewPropertyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    // var controller = ViewPropertyController.instance;

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
