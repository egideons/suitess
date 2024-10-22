import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/app/home_screen_controller.dart';
import 'package:suitess/views/android/screens/home/content/android_home_screen_scaffold.dart';

class AndroidHomeScreen extends StatelessWidget {
  const AndroidHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(HomeScreenController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidHomeScreenScaffold(),
    );
  }
}
