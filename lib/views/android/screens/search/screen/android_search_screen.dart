import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/app/search_screen_controller.dart';
import '../content/android_search_screen_scaffold.dart';

class AndroidSearchScreen extends StatelessWidget {
  const AndroidSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(SearchScreenController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidSearchScreenScaffold(),
    );
  }
}
