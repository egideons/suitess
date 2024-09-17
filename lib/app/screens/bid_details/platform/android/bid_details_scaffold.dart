import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/controllers/app/bid_details_controller.dart';

class BidDetailsScaffold extends GetView<BidDetailsController> {
  const BidDetailsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    // var controller = BidDetailsController.instance;

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
