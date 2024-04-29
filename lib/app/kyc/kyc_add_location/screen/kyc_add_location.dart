import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/src/controllers/kyc_choose_location_controller.dart';

import '../widgets/android/kyc_add_location_scaffold.dart';
import '../widgets/ios/kyc_add_location_cupertino_scaffold.dart';

class KycAddLocation extends StatelessWidget {
  const KycAddLocation({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(KycAddLocationController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const KycAddLocationCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const KycAddLocationScaffold(),
    );
  }
}
