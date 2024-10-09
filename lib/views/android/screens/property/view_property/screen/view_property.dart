import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controllers/app/view_property_controller.dart';
import '../platform/android/view_property_scaffold.dart';
import '../platform/ios/landlord_view_property_cupertino_scaffold.dart';

class ViewProperty extends StatelessWidget {
  const ViewProperty({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(ViewPropertyController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const ViewPropertyCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const ViewPropertyScaffold(),
    );
  }
}
