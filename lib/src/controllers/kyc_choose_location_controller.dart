import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KycChooseLocationController extends GetxController {
  static KycChooseLocationController get instance {
    return Get.find<KycChooseLocationController>();
  }

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Booleans ===========\\
  var isLoading = false.obs;

  //=========== Variables ===========\\
  var responseStatus = 0.obs;
  var responseMessage = "".obs;

  //=========== On changed Functions ===========\\

  //=========== Submit form ===========\\
}
