import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../routes/routes.dart';

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
  var selectedProfileImage = Rx<XFile?>(null);
  // XFile? selectedProfileImage;

  //=========== Variables ===========\\
  pickImage({ImageSource? source, CameraDevice? cameraDevice}) async {
    selectedProfileImage.value = await _picker.pickImage(
      source: source ?? ImageSource.camera,
      preferredCameraDevice: cameraDevice ?? CameraDevice.front,
      imageQuality: 100,
    );
    // if (image != null) {
    //   selectedProfileImage.value = image;
    // }
    update();
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

    // Get.to(
    //   () => const AndroidCongratulationsSplashScreen(),
    //   routeName: "/congratulations-splash-screen",
    //   fullscreenDialog: true,
    //   curve: Curves.easeInOut,
    //   preventDuplicates: true,
    //   popGesture: false,
    //   transition: Get.defaultTransition,
    // );
    Get.toNamed(Routes.congratulationsSplashScreen, preventDuplicates: true);

    isLoading.value = false;
    update();
  }
}
