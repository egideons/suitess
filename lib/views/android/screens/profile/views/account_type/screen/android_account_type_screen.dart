import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controllers/app/account_type_controller.dart';
import '../content/android_account_type_scaffold.dart';

class AndroidAccountTypeScreen extends StatelessWidget {
  const AndroidAccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(AccountTypeController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const HomeScreenCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidAccountTypeScaffold(),
    );
  }
}
