import 'package:get/get.dart';

class KycProfilePhotoController extends GetxController {
  static KycProfilePhotoController get instance {
    return Get.find<KycProfilePhotoController>();
  }

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var formIsValid = false.obs;

  //=========== Variables ===========\\
  var responseStatus = 0.obs;
  var responseMessage = "".obs;

  //=========== onChanged Functions ===========\\

  photoOnChanged(value) {
    if (value.length == 11) {
      setFormIsValid();
    } else {
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

    isLoading.value = false;
    update();
  }
}
