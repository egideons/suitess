import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/others/loading_controller.dart';
import 'package:suitess/main.dart';
import 'package:suitess/views/android/splash/loading/screen/loading_screen.dart';

import '../others/api_processor_controller.dart';

class ResetTxPinController extends GetxController {
  static ResetTxPinController get instance {
    return Get.find<ResetTxPinController>();
  }

  @override
  void onInit() {
    txPin1FN.requestFocus();
    super.onInit();
  }

  //=========== Variables ===========\\
  var isLoading = false.obs;
  var formIsValid = false.obs;

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //================ Transaction PIN ===================\\
  var txPin1EC = TextEditingController();
  var txPin2EC = TextEditingController();
  var txPin3EC = TextEditingController();
  var txPin4EC = TextEditingController();

  var txPin1FN = FocusNode();
  var txPin2FN = FocusNode();
  var txPin3FN = FocusNode();
  var txPin4FN = FocusNode();

  //================= Transaction Pins Onchanged ======================\\
  txPin1Onchanged(value, context) {
    if (value.isEmpty) {
      return;
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
  }

  txPin2Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
  }

  txPin3Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
  }

  txPin4Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
    if (value.length == 1) {
      FocusScope.of(context).nearestScope;

      return;
    }
  }

  //=========== on Submitted ===========\\
  onTxPinSubmitted(value) {
    submitTXPIN();
  }

  Future<void> submitTXPIN() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (txPin1EC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter pin 1");
        return;
      } else if (txPin2EC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter pin 2");
        return;
      } else if (txPin3EC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter pin 3");
        return;
      } else if (txPin4EC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter pin 4");
        return;
      }

      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 3));
      ApiProcessorController.successSnack("Wallet created successfully");
      prefs.setBool("hasViewedWalletIntro", true);

      Get.close(3);

      await Get.offAll(
        () => LoadingScreen(
          loadData: LoadingController.instance.loadWalletTab,
        ),
        routeName: "/loading-screen",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
      );
      isLoading.value = false;
    }
  }
}
