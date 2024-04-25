import 'package:get/get.dart';

class ChooseExperienceController extends GetxController {
  static ChooseExperienceController get instance {
    return Get.find<ChooseExperienceController>();
  }

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var formIsValid = false.obs;

  //=========== Variables ===========\\
  var responseStatus = 0.obs;
  var responseMessage = "".obs;
}
