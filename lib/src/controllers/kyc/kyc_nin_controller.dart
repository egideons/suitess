import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:suitess/app/android/kyc/kyc_profile_photo/screen/kyc_profile_photo.dart';

class KycNINController extends GetxController {
  static KycNINController get instance {
    return Get.find<KycNINController>();
  }

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
  final ninEC = TextEditingController();

  //=========== Focus nodes ===========\\
  final ninFN = FocusNode();

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var isNinValid = false.obs;
  var ninIsHidden = true.obs;
  var formIsValid = false.obs;

  //=========== Variables ===========\\
  var responseStatus = 0.obs;
  var responseMessage = "".obs;

  //=========== onChanged Functions ===========\\

  ninOnChanged(value) {
    if (value.length == 11) {
      isNinValid.value = true;
      setFormIsValid();
    } else {
      isNinValid.value = false;
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
        () => const KycProfilePhoto(),
        routeName: "/kyc-profile-photo",
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
