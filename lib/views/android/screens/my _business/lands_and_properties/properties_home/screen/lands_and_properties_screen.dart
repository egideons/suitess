import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/app/lands_and_properties_controller.dart';

import '../platform/android/lands_and_properties_scaffold.dart';

class LandsAndPropertiesScreen extends StatelessWidget {
  const LandsAndPropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(LandsAndPropertiesController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const LandsAndPropertiesScaffold(),
    );
  }
}
