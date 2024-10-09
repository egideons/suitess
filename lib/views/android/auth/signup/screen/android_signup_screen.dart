import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/auth/signup_controller.dart';

import '../content/android_signup_scaffold.dart';

class AndroidSignupScreen extends StatelessWidget {
  const AndroidSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(SignupController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidSignupScaffold(),
    );
  }
}
