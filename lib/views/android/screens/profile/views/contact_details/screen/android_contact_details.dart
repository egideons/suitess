import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controllers/app/contact_details_controller.dart';
import '../content/android_contact_details_scaffold.dart';

class AndroidContactDetailsScreen extends StatelessWidget {
  const AndroidContactDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(ContactDetailsScreenController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidContactDetailsScaffold(),
    );
  }
}
