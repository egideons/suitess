import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NINController extends GetxController {
  static NINController get instance {
    return Get.find<NINController>();
  }

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
  final ninEC = TextEditingController();

  //=========== Focus nodes ===========\\
  final ninFN = FocusNode();

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var isNINValid = false.obs;
  var ninIsHidden = true.obs;
  var formIsValid = false.obs;

  var responseStatus = 0.obs;
  var responseMessage = "".obs;

  //=========== onChanged Functions ===========\\

  ninOnChanged(value) {
    if (value.length == 11) {
      isNINValid.value = true;
      setFormIsValid();
    } else {
      isNINValid.value = false;
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

      // Get.offAll(
      //   () => const ninOTP(),
      //   routeName: "/nin-otp",
      //   fullscreenDialog: true,
      //   curve: Curves.easeInOut,
      //   predicate: (routes) => false,
      //   popGesture: false,
      //   transition: Get.defaultTransition,
      // );
    }
    isLoading.value = false;
    update();
  }
}
