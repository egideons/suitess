import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/controllers/app/business_intro_controller.dart';

import '../content/android_business_intro_scaffold.dart';

class AndroidBusinessIntroScreen extends StatelessWidget {
  const AndroidBusinessIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(BusinessIntroController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidBusinessIntroScaffold(),
    );
  }
}
