import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/app/upload_property_images_controller.dart';
import 'package:suitess/views/android/screens/my%20_business/lands_and_properties/upload_property_images/content/android_upload_property_images_scaffold.dart';

class AndroidUploadPropertyImagesScreen extends StatelessWidget {
  const AndroidUploadPropertyImagesScreen({super.key});

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
      child: const AndroidUploadPropertyImagesScaffold(),
    );
  }
}
