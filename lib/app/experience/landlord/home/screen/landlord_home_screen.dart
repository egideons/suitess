import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/experience/landlord/home/widgets/android/landlord_dashboard_scaffold.dart';
import 'package:suitess/app/experience/landlord/home/widgets/ios/landlord_homescreen_cupertino_scaffold.dart';
import 'package:suitess/src/controllers/landlord/landlord_homescreen_controller.dart';

class LandLordHomeScreen extends StatelessWidget {
  const LandLordHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(LandlordHomescreenController());

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
