import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
  final ImagePicker _picker = ImagePicker();
  XFile? selectedProfileImage;

  //=========== Variables ===========\\
  pickImage({ImageSource? source, CameraDevice? cameraDevice}) async {
    final XFile? image = await _picker.pickImage(
      source: source ?? ImageSource.camera,
      preferredCameraDevice: cameraDevice ?? CameraDevice.front,
      imageQuality: 100,
    );
    if (image != null) {
      selectedProfileImage = image;
      update();
    }
  }

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
