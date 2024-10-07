import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/app/bid_details_controller.dart';
import '../platform/android/bid_details_scaffold.dart';
import '../platform/ios/bid_details_cupertino_scaffold.dart';

class BidDetailsScreen extends StatelessWidget {
  const BidDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(BidDetailsController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const BidDetailsCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const BidDetailsScaffold(),
    );
  }
}
