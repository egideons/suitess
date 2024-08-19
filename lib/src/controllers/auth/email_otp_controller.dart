import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/kyc/kyc_add_location/screen/kyc_add_location.dart';
import '../../models/auth/verify_email_otp_response_model.dart';
import '../../services/api/api_url.dart';
import '../../services/client/client_service.dart';
import '../others/api_processor_controller.dart';

class EmailOTPController extends GetxController {
  static EmailOTPController get instance {
    return Get.find<EmailOTPController>();
  }

  @override
  void onInit() {
    requestOTP();
    startTimer();
    pin1FN.requestFocus();
    super.onInit();
  }

  //=========== Variables ===========\\
  var otpResponse = VerifyOTPResponseModel.fromJson(null).obs;
  late Timer _timer;

  //=========== Form Key ===========\\

  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
  final emailEC = TextEditingController();
  final pin1EC = TextEditingController();
  final pin2EC = TextEditingController();
  final pin3EC = TextEditingController();
  final pin4EC = TextEditingController();
  final pin5EC = TextEditingController();
  final pin6EC = TextEditingController();

  //=========== Focus nodes ===========\\
  final pin1FN = FocusNode();
  final pin2FN = FocusNode();
  final pin3FN = FocusNode();
  final pin4FN = FocusNode();
  final pin5FN = FocusNode();
  final pin6FN = FocusNode();

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
      FocusScope.of(context).nextFocus();
    }
    update();
  }

  pin5Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
      setFormIsInvalid();
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
    update();
  }

  pin6Onchanged(value, context) {
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
    secondsRemaining.value = 30;
    timerComplete.value = false;
    // startTimer();
    update();

    var url = ApiUrl.baseUrl + ApiUrl.auth + ApiUrl.sendEmailOTP;

    Map data = {
      "email": "gideon.dart@gmail.com",
    };

    log("This is the Url: $url");
    log("This is the Signup Data: $data");

    // Client service
    var response = await ClientService.postRequest(
      url,
      data,
    );

    if (response == null) {
      isLoading.value = false;
      update();
      return;
    }

    try {
      if (response.statusCode == 200) {
        // Convert to json
        dynamic responseJson;
        if (response.data is String) {
          responseJson = jsonDecode(response.data);
        } else {
          responseJson = response.data;
        }

        log("This is the response body ====> ${response.data}");

        //Map the response json to the model provided
        otpResponse.value = VerifyOTPResponseModel.fromJson(responseJson);

        ApiProcessorController.successSnack(
          "An OTP has been sent to your email",
        );
      } else {
        log("Request failed with status: ${response.statusCode}");
        log("Response body: ${response.data}");
      }
    } catch (e) {
      log(e.toString());
    }
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

  //================= Submit OTP ======================\\
  Future<void> submitOTP() async {
    isLoading.value = true;
    update();

    //Pause the timer
    pauseTimer();
    timerComplete.value = false;

    var url = ApiUrl.baseUrl + ApiUrl.auth + ApiUrl.verifyOTP;

    var otpCode = pin1EC.text +
        pin2EC.text +
        pin3EC.text +
        pin4EC.text +
        pin5EC.text +
        pin6EC.text;

    Map data = {
      "email": "gideon.dart@gmail.com",
      "otp": otpCode,
      "type": "email",
      "purpose": "registration",
    };

    log("This is the Url: $url");
    log("This is the Signup Data: $data");

    // Client service
    var response = await ClientService.postRequest(
      url,
      data,
    );

    if (response == null) {
      isLoading.value = false;
      update();
      return;
    }

    try {
      if (response.statusCode == 200) {
        // Convert to json
        dynamic responseJson;
        if (response.data is String) {
          responseJson = jsonDecode(response.data);
        } else {
          responseJson = response.data;
        }

        log("This is the response body ====> ${response.data}");

        //Map the response json to the model provided
        otpResponse.value = VerifyOTPResponseModel.fromJson(responseJson);

        ApiProcessorController.successSnack("Verification successful");
        Get.offAll(
          () => const KycAddLocation(),
          routeName: "/kyc-add-location",
          fullscreenDialog: true,
          curve: Curves.easeInOut,
          predicate: (routes) => false,
          popGesture: false,
          transition: Get.defaultTransition,
        );
      } else {
        ApiProcessorController.errorSnack(otpResponse.value.message);
        log("Request failed with status: ${response.statusCode}");
        log("Response body: ${response.data}");
        isLoading.value = false;
        update();
        return;
      }
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
      update();
      return;
    }

    isLoading.value = false;
    update();

    //Continue the timer and enable resend button
    startTimer();
  }
}
