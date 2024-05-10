import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/src/controllers/auth/signup_controller.dart';

import '../widgets/android/signup_scaffold.dart';
import '../widgets/ios/signup_cupertino_scaffold.dart';

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
