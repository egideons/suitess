import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/app/mobile_data_controller.dart';
import '../platform/android/mobile_data_scaffold.dart';

class MobileDataScreen extends StatelessWidget {
  const MobileDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(MobileDataController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const MobileDataScaffold(),
    );
  }
}
