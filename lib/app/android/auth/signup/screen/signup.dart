import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/controllers/auth/signup_controller.dart';

import '../platform/android/signup_scaffold.dart';
import '../platform/ios/signup_cupertino_scaffold.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(SignupController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const SignupCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const SignupScaffold(),
    );
  }
}
