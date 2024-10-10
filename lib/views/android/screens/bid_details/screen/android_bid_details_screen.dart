import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/app/bid_details_controller.dart';
import '../content/android_bid_details_scaffold.dart';

class AndroidBidDetailsScreen extends StatelessWidget {
  const AndroidBidDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(BidDetailsController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidBidDetailsScaffold(),
    );
  }
}
