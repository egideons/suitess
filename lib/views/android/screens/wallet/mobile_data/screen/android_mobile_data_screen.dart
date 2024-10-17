import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controllers/app/mobile_data_controller.dart';
import '../content/android_mobile_data_scaffold.dart';

class AndroidMobileDataScreen extends StatelessWidget {
  const AndroidMobileDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(MobileDataController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidMobileDataScaffold(),
    );
  }
}
