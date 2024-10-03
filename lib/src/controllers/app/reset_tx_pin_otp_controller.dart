import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/auth/verify_otp_response_model.dart';
import '../../routes/routes.dart';
import '../../services/api/api_url.dart';
import '../../services/client/dio_client_service.dart';
import '../../services/client/http_client_service.dart';
import '../others/api_processor_controller.dart';

class ResetTxPinOTPController extends GetxController {
  static ResetTxPinOTPController get instance {
    return Get.find<ResetTxPinOTPController>();
  }

  @override
  void onInit() {
    startTimer();
    pin1FN.requestFocus();
    super.onInit();
  }

  //=========== Variables ===========\\
  var otpResponse = VerifyOTPResponseModel.fromJson(null).obs;
  late Timer _timer;
  var resetOptionIsEmail = true.obs;

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
    secondsRemaining.value = 60;
    timerComplete.value = false;
    update();

    var url = ApiUrl.authBaseUrl + ApiUrl.auth + ApiUrl.resetPasswordOTP;

    Map data = {
      "type": "email",
      "email": emailEC.text,
    };

    log("This is the Url: $url");
    log("This is the OTP Data: $data");

    // Client service
    var response = await DioClientService.postRequest(
      url,
      data,
    );

    if (response == null) {
      isLoading.value = false;
      update();
      return;
    }

    try {
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
      if (response.statusCode == 200) {
        ApiProcessorController.successSnack(
          "An OTP has been sent to your email",
        );
        startTimer();
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

  //================= Send OTP ======================\\
  Future<void> submitOTP() async {
    isLoading.value = true;
    update();

    //Pause the timer
    pauseTimer();
    timerComplete.value = false;

    var url = ApiUrl.authBaseUrl + ApiUrl.auth + ApiUrl.resetPasswordOTPVerify;

    var otpCode = pin1EC.text +
        pin2EC.text +
        pin3EC.text +
        pin4EC.text +
        pin5EC.text +
        pin6EC.text;

    Map data = {
      "type": "email",
      "email": emailEC.text,
      "otp": otpCode,
      "purpose": "reset",
    };

    log("This is the Url: $url");
    log("This is the phone otp Data: $data");

//HTTP Client Service
    http.Response? response =
        await HttpClientService.postRequest(url, null, data);

    //Dio Client Service
    // var response = await DioClientService.postRequest(
    //   url,
    //   data,
    // );
    if (response == null) {
      isLoading.value = false;
      if (secondsRemaining.value == 60) {
        secondsRemaining.value = 0;
        //Continue the timer and enable resend button
        update();
        startTimer();
        return;
      }
      //Continue the timer and enable resend button
      startTimer();
      update();
      return;
    }

    try {
      // Convert to json
      dynamic responseJson;
      responseJson = jsonDecode(response.body);

      log("This is the response body ====> ${response.body}");

      //Map the response json to the model provided
      otpResponse.value = VerifyOTPResponseModel.fromJson(responseJson);
      if (response.statusCode == 200) {
        ApiProcessorController.successSnack("OTP verification successful");
        Get.toNamed(
          Routes.resetPassword,
          preventDuplicates: true,
          arguments: {"isPhoneOTP": false},
          parameters: {
            "type": "email",
            "otpCode": otpCode,
            "email": emailEC.text,
          },
        );
      } else {
        ApiProcessorController.warningSnack(otpResponse.value.message);
        log("Request failed with status: ${response.statusCode}");
        log("Response body: ${response.body}");
      }
    } catch (e) {
      log(e.toString());
    }
    isLoading.value = false;
    update();

    if (secondsRemaining.value == 0) {
      secondsRemaining.value = 60;
      //Continue the timer and enable resend button
      startTimer();
      return;
    }
    //Continue the timer and enable resend button
    startTimer();
    update();
    return;
  }
}
