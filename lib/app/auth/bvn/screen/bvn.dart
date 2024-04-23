import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../src/controllers/bvn_controller.dart';
import '../widgets/ios/bvn_cupertino_scaffold.dart';

class Bvn extends StatelessWidget {
  const Bvn({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize otp controller
    Get.put(BvnController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const BvnCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const Scaffold(),
    );
  }
}
