import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../src/controllers/app/landlord_bid_detail_controller.dart';
import '../platform/android/landlord_bid_details_scaffold.dart';
import '../platform/ios/landlord_bid_details_cupertino_scaffold.dart';

class BidDetails extends StatelessWidget {
  const BidDetails({super.key});

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
