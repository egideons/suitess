import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/controllers/others/choose_experience_controller.dart';

import '../widgets/android/choose_experience_scaffold.dart';
import '../widgets/ios/choose_experience_cupertino_scaffold.dart';

class ChooseExperience extends StatelessWidget {
  const ChooseExperience({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize controllers
    Get.put(ChooseExperienceController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const ChooseExperienceCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const ChooseExperienceScaffold(),
    );
  }
}
