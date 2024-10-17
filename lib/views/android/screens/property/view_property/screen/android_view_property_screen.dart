import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controllers/app/view_property_controller.dart';
import '../content/android_view_property_scaffold.dart';

class AndroidViewPropertyScreen extends StatelessWidget {
  const AndroidViewPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(ViewPropertyController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidViewPropertyScaffold(),
    );
  }
}
