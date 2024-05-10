import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../src/controllers/landlord/landlord_view_property_controller.dart';
import '../widgets/android/landlord_view_property_scaffold.dart';
import '../widgets/ios/landlord_view_property_cupertino_scaffold.dart';

class LandLordViewProperty extends StatelessWidget {
  const LandLordViewProperty({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(LandLordViewPropertyController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const LandLordViewPropertyCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const LandLordViewPropertyScaffold(),
    );
  }
}
