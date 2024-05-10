import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../src/controllers/landlord/landlord_add_property_controller.dart';
import '../widgets/android/landlord_add_property_scaffold.dart';
import '../widgets/ios/landlord_add_property_cupertino_scaffold.dart';

class LandLordAddProperty extends StatelessWidget {
  const LandLordAddProperty({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(LandLordAddPropertyController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const LandLordAddPropertyCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const LandLordAddPropertyScaffold(),
    );
  }
}
