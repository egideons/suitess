import 'dart:io';

import 'package:flutter/material.dart';

class KycBvn extends StatelessWidget {
  const KycBvn({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize otp controller
    // Get.put(BvnController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        // child: const BvnCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const Scaffold(),
    );
  }
}
