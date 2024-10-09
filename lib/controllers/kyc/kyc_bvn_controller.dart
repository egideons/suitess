import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../views/android/kyc/kyc_bvn_otp/screen/android_kyc_bvn_otp.dart';

class KycBvnController extends GetxController {
  static KycBvnController get instance {
    return Get.find<KycBvnController>();
  }

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
  final bvnEC = TextEditingController();

  //=========== Focus nodes ===========\\
  final bvnFN = FocusNode();

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var isBvnValid = false.obs;
  var bvnIsHidden = true.obs;
  var formIsValid = false.obs;

  var responseStatus = 0.obs;
  var responseMessage = "".obs;

  //=========== onChanged Functions ===========\\

  bvnOnChanged(value) {
    if (value.length == 11) {
      isBvnValid.value = true;
      setFormIsValid();
    } else {
      isBvnValid.value = false;
      setFormIsInvalid();
    }
    update();
  }

  setFormIsValid() {
    formIsValid.value = true;
  }

  setFormIsInvalid() {
    formIsValid.value = false;
  }

  //=========== Submit ===========\\
  onSubmitted(value) {
    if (formIsValid.isTrue) {
      submit();
    }
  }

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      isLoading.value = true;
      update();

      await Future.delayed(const Duration(seconds: 3));

      Get.offAll(
        () => const AndroidKycBvnOTPScreen(),
        routeName: "/kyc-bvn-otp",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
      );
    }
    isLoading.value = false;
    update();
  }
}
