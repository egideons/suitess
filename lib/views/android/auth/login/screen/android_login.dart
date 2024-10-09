import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../src/controllers/auth/login_controller.dart';
import '../content/android_login_scaffold.dart';

class AndroidLoginScreen extends StatelessWidget {
  const AndroidLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(LoginController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidLoginScaffold(),
    );
  }
}
