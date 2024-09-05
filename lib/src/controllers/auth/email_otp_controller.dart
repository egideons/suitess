import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../app/auth/phone_otp/screen/phone_otp.dart';
import '../../../app/kyc/kyc_add_location/screen/kyc_add_location.dart';
import '../../../main.dart';
import '../../models/auth/login_response_model.dart';
import '../../models/auth/verify_otp_response_model.dart';
import '../../services/api/api_url.dart';
import '../../services/client/dio_client_service.dart';
import '../../services/client/http_client_service.dart';
import '../others/api_processor_controller.dart';

class EmailOTPController extends GetxController {
  static EmailOTPController get instance {
    return Get.find<EmailOTPController>();
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
  var userToken = prefs.getString("userToken");

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
    update();

    var url = ApiUrl.baseUrl + ApiUrl.auth + ApiUrl.sendEmailOTP;

    Map data = {
      "email": userEmail,
    };

    log("This is the Url: $url");
    log("This is the Signup email address: $data");

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
      log("This is the response json ====> $responseJson");

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

  //=========== Navigation ===========\\
  sendToPhone() {
    // ApiProcessorController.errorSnack("This option is not yet available");
    Get.off(
      () => PhoneOTP(
        userPhoneNumber: userPhoneNumber,
        userEmail: userEmail,
      ),
      arguments: {
        "email": userEmail,
        "phoneNumber": userPhoneNumber,
      },
      routeName: "/phone-otp",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      preventDuplicates: true,
      popGesture: false,
      transition: Get.defaultTransition,
    );
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
      "email": userEmail,
      "otp": otpCode,
      "type": "email",
      "purpose": "registration",
    };

    log("This is the Url: $url");
    log("This is the email otp data: $data");

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
        ApiProcessorController.successSnack(
          "Signup successful",
        );
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
        log("Response body: ${response.body}");
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

  loginUser() async {
    var url = ApiUrl.baseUrl + ApiUrl.auth + ApiUrl.login;

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
      update();
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

        log("This is the user token: $userToken");

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
