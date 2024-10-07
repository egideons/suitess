import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suitess/app/android/kyc/kyc_add_location/screen/kyc_add_location.dart';

import '../../../app/android/auth/email_otp/screen/email_otp.dart';
import '../../../main.dart';
import '../../models/auth/login_response_model.dart';
import '../../models/auth/verify_otp_response_model.dart';
import '../../services/api/api_url.dart';
import '../../services/client/dio_client_service.dart';
import '../../services/client/http_client_service.dart';
import '../others/api_processor_controller.dart';

class PhoneOTPController extends GetxController {
  static PhoneOTPController get instance {
    return Get.find<PhoneOTPController>();
  }

  @override
  void onInit() {
    requestOTP();
    pin1FN.requestFocus();
    super.onInit();
  }

  //=========== Variables ===========\\
  var otpResponse = VerifyOTPResponseModel.fromJson(null).obs;
  var loginResponse = LoginResponseModel.fromJson(null).obs;
  var loginResponseMessage = "".obs;

  late Timer _timer;
  var userEmail = Get.arguments?['email'] ?? "";
  var userPhoneNumber = Get.arguments?['phoneNumber'] ?? "";
  var userPassword = Get.arguments?["password"] ?? "";

  //=========== Form Key ===========\\

  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
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
  }

  pin2Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
      setFormIsInvalid();
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
  }

  pin3Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
      setFormIsInvalid();
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
  }

  pin4Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
      setFormIsInvalid();
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
  }

  pin5Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
      setFormIsInvalid();
    }
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
  }

  pin6Onchanged(value, context) {
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
      setFormIsInvalid();
    }
    if (value.length == 1) {
      FocusScope.of(context).nearestScope;
      setFormIsValid();
      return;
    }
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
    var url = ApiUrl.authBaseUrl + ApiUrl.auth + ApiUrl.sendPhoneOTP;

    Map data = {
      "phone": userPhoneNumber,
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
      log("This is the response json ====> $responseJson");

      if (response.statusCode == 200) {
        ApiProcessorController.successSnack(
          "An OTP has been sent to your phone number",
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
    }
  }

  //=========== Navigation ===========\\
  sendToEmail() {
    Get.off(
      () => EmailOTP(
        userPhoneNumber: userPhoneNumber,
        userEmail: userEmail,
      ),
      arguments: {
        "email": userEmail,
        "phoneNumber": userPhoneNumber,
        "password": userPassword,
      },
      routeName: "/email-otp",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      preventDuplicates: true,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }

  //================= Send OTP ======================\\
  Future<void> submitOTP() async {
    isLoading.value = true;
    //Pause the timer
    pauseTimer();
    timerComplete.value = false;

    var url = ApiUrl.authBaseUrl + ApiUrl.auth + ApiUrl.verifyOTP;

    var otpCode = pin1EC.text +
        pin2EC.text +
        pin3EC.text +
        pin4EC.text +
        pin5EC.text +
        pin6EC.text;

    log("This is the user email:$userEmail");
    log("This is the user phone numberq:$userPhoneNumber");
    log("This is the user password:$userPassword");

    Map data = {
      "phone": userPhoneNumber,
      "otp": otpCode,
      "type": "phone",
      "purpose": "registration",
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
        ApiProcessorController.successSnack("Verification successful");

        await loginUser();

        await Get.offAll(
          () => const KycAddLocation(),
          routeName: "/kyc-add-location",
          fullscreenDialog: true,
          curve: Curves.easeInOut,
          predicate: (routes) => false,
          popGesture: false,
          transition: Get.defaultTransition,
        );
      } else {
        ApiProcessorController.warningSnack(otpResponse.value.message);
        log("Request failed with status: ${response.statusCode}");
        log("Response body: ${response.body}");
        isLoading.value = false;
        return;
      }
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
      return;
    }

    isLoading.value = false;
    //Continue the timer and enable resend button
    startTimer();
  }

  Future<void> loginUser() async {
    var url = ApiUrl.authBaseUrl + ApiUrl.auth + ApiUrl.login;

    Map data = {
      "email": userEmail,
      "password": userPassword,
    };

    log("This is the Url: $url");
    log("This is the login data: $data");

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
      return;
    }

    try {
      // Convert to json
      dynamic responseJson;

      responseJson = jsonDecode(response.body);

      log("This is the response body ====> ${response.body}");

      //Map the response json to the model provided
      loginResponse.value = LoginResponseModel.fromJson(responseJson);
      loginResponseMessage.value = loginResponse.value.message;

      if (response.statusCode == 200) {
        prefs.setBool("isLoggedIn", true);

        //Save state that the user token
        prefs.setString(
          "userToken",
          loginResponse.value.data.token,
        );

        log("User has logged in successfully");
      } else {
        log("Request failed with status: ${response.statusCode}");
        log("Response body: ${response.body}");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
