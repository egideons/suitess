import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/src/controllers/landlord_bid_detail_controller.dart';

class LandLordBidDetailsScaffold extends GetView<LandLordBidDetailsController> {
  const LandLordBidDetailsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    // var colorScheme = Theme.of(context).colorScheme;

    // var controller = LandLordBidDetailsController.instance;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [],
      ),
    );
  }
}