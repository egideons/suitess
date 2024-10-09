import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../src/controllers/kyc/kyc_profile_photo_controller.dart';
import '../content/kyc_profile_photo_scaffold.dart';

class AndroidKycProfilePhotoScreen extends StatelessWidget {
  const AndroidKycProfilePhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize controllers
    Get.put(KycProfilePhotoController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidKycProfilePhotoScaffold(),
    );
  }
}
