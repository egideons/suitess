import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/kyc/kyc_profile_photo_controller.dart';
import '../widgets/android/kyc_profile_photo_scaffold.dart';
import '../widgets/ios/kyc_profile_photo_cupertino_scaffold.dart';

class KycProfilePhoto extends StatelessWidget {
  const KycProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize controllers
    Get.put(KycProfilePhotoController());

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: const KycProfilePhotoCupertinoScaffold(),
      );
    }
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const KycProfilePhotoScaffold(),
    );
  }
}
