import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/src/controllers/kyc_choose_location_controller.dart';

import '../widgets/ios/kyc_choose_location_cupertino_scaffold.dart';

class KycChooseLocation extends StatelessWidget {
  const KycChooseLocation({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(KycChooseLocationController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const KycChooseLocationCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const Scaffold(),
    );
  }
}
