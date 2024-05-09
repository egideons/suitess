import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/landlord_bid_detail_controller.dart';
import '../widgets/android/landlord_bid_details_scaffold.dart';
import '../widgets/ios/landlord_bid_details_cupertino_scaffold.dart';

class LandLordBidDetails extends StatelessWidget {
  const LandLordBidDetails({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(LandLordBidDetailsController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const LandLordBidDetailsCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const LandLordBidDetailsScaffold(),
    );
  }
}
