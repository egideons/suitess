import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/android/my%20_business/lands_and_properties/upload_property_images/platform/android/upload_property_images_scaffold.dart';
import 'package:suitess/src/controllers/app/upload_property_images_controller.dart';

class UploadPropertyImagesScreen extends StatelessWidget {
  const UploadPropertyImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(UploadPropertyImagesController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const UploadPropertyImagesScaffold(),
    );
  }
}
