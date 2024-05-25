import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/auth/forgot_password/widgets/android/forgot_password_scaffold.dart';
import 'package:suitess/app/auth/forgot_password/widgets/ios/forgot_password_cupertino_scaffold.dart';
import 'package:suitess/src/controllers/auth/forgot_password_controller.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});
  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(ForgotPasswordController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const ForgotPasswordCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const ForgotPasswordScaffold(),
    );
  }
}
