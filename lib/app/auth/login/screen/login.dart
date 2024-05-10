import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../src/controllers/auth/login_controller.dart';
import '../widgets/android/login_scaffold.dart';
import '../widgets/ios/login_cupertino_scaffold.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(LoginController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const LoginCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const LoginScaffold(),
    );
  }
}
