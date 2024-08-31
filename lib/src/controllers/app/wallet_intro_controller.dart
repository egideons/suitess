import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletIntroController extends GetxController {
  static WalletIntroController get instance {
    return Get.find<WalletIntroController>();
  }

  //================== Keys ====================\\
  final formKey = GlobalKey<FormState>();

  //================== Controllers ====================\\
  var pageController = PageController();

  //=========== Page 1 ============\\
  navigateToPage2() {
    pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
