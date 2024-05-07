import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/app/experience/landlord/home/widgets/android/landlord_dashboard_scaffold.dart';
import 'package:kribb/app/experience/landlord/home/widgets/ios/landlord_homescreen_cupertino_scaffold.dart';

import '../../../../../src/controllers/landlord_view_property_controller.dart';

class LandLordViewProperty extends StatelessWidget {
  const LandLordViewProperty({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(LandLordViewPropertyController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const LandLordHomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const LandLordHomeScreenScaffold(),
    );
  }
}
