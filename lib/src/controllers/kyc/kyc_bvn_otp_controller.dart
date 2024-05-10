import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/kyc/kyc_nin/screen/kyc_nin.dart';
import '../others/api_processor_controller.dart';

class KycBvnOTPController extends GetxController {
  static KycBvnOTPController get instance {
    return Get.find<KycBvnOTPController>();
  }

  @override
  void onInit() {
    startTimer();
    log("OTP Timer has started");
    super.onInit();
  }

  //=========== Variables ===========\\

  late Timer _timer;

  //=========== Form Key ===========\\

  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\

  final emailEC = TextEditingController();
  final pin1EC = TextEditingController();
  final pin2EC = TextEditingController();
  final pin3EC = TextEditingController();
  final pin4EC = TextEditingController();

  //=========== Focus nodes ===========\\
  final pin1FN = FocusNode();
  final pin2FN = FocusNode();
  final pin3FN = FocusNode();
  final pin4FN = FocusNode();

  //=========== Booleans ===========\\
  var secondsRemaining = 30.obs;
  var isLoading = false.obs;
  var formIsValid = false.obs;
  var timerComplete = false.obs;

  //====================== Functions =========================\\

  //================= Onchanged ======================\\
  pin1Onchanged(value, context) {
    if (value.isEmpty) {
      setFormIsInvalid();
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
    update();
  }

  pin2Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
      setFormIsInvalid();
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
    update();
  }

  pin3Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
      setFormIsInvalid();
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
    update();
  }

  pin4Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
      setFormIsInvalid();
    }
    if (value.length == 1) {
      FocusScope.of(context).nearestScope;
      setFormIsValid();
      update();
      return;
    }
    update();
  }

  //================= Start Timer ======================\\
  startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
      } else {
        timerComplete.value = true;
        _timer.cancel();
      }
    });
  }

  pauseTimer() {
    if (timerComplete.value == false && isLoading.value == true) {
      _timer.cancel();
    }
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  //================= Resend OTP ======================\\
  void requestOTP() async {
    secondsRemaining.value = 60;
    timerComplete.value = false;
    startTimer();
    update();
    ApiProcessorController.successSnack(
      "An OTP has been sent to your phone number",
    );
  }

  //================= Set form validity ======================\\

  setFormIsValid() {
    formIsValid.value = true;
  }

  setFormIsInvalid() {
    formIsValid.value = false;
  }

  //=========== on Submitted ===========\\
  onSubmitted(value) {
    if (formIsValid.isTrue) {
      submitOTP();
      update();
    }
  }

  //================= Send OTP ======================\\
  Future<void> submitOTP() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (pin1EC.text.isEmpty) {
        setFormIsInvalid();
        update();
        return;
      } else if (pin2EC.text.isEmpty) {
        setFormIsInvalid();
        update();
        return;
      } else if (pin3EC.text.isEmpty) {
        setFormIsInvalid();
        update();
        return;
      } else if (pin4EC.text.isEmpty) {
        setFormIsInvalid();
        update();
        return;
      }

      isLoading.value = true;
      update();

      //Pause the timer
      pauseTimer();
      timerComplete.value = false;

      await Future.delayed(const Duration(seconds: 3));

      Get.offAll(
        () => const KycNIN(),
        routeName: "/kyc-nin",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
      );

      isLoading.value = false;
      update();

      //Continue the timer and enable resend button
      onInit();
    }
  }
}
