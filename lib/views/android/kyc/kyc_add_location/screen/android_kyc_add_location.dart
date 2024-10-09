import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/kyc/kyc_choose_location_controller.dart';

import '../content/android_kyc_add_location_scaffold.dart';

class AndroidKycAddLocation extends StatelessWidget {
  const AndroidKycAddLocation({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize signup controller
    Get.put(KycAddLocationController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidKycAddLocationScaffold(),
    );
  }
}
