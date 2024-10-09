import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suitess/controllers/auth/user_controller.dart';
import 'package:suitess/models/user/user_model.dart';
import 'package:suitess/views/android/screens/wallet/reset_tx_pin_options/reset_tx_pin_otp/screen/reset_tx_pin_otp.dart';

import '../../constants/consts.dart';
import '../../models/auth/verify_otp_response_model.dart';
import '../../services/api/api_url.dart';
import '../../services/client/http_client_service.dart';
import '../others/api_processor_controller.dart';

class ResetTxPinViaEmailController extends GetxController {
  static ResetTxPinViaEmailController get instance {
    return Get.find<ResetTxPinViaEmailController>();
  }

  @override
  void onInit() {
    emailFN.requestFocus();
    emailEC.text = user.email ?? "";
    if (emailEC.text.isNotEmpty &&
        emailEC.text == user.email &&
        user.email!.isNotEmpty) {
      isEmailValid.value = true;
      setFormIsValid();
    }
    super.onInit();
  }

  var otpResponse = VerifyOTPResponseModel.fromJson(null).obs;
  var user =
      UserController.instance.userModel.value.data ?? UserData.fromJson(null);

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
  var emailEC = TextEditingController();

  //=========== Focus nodes ===========\\
  final emailFN = FocusNode();

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var isEmailValid = false.obs;
  var formIsValid = false.obs;
  var responseStatus = 0.obs;
  var responseMessage = "".obs;

  //=========== onChanged Functions ===========\\

  emailOnChanged(value) {
    var emailRegExp = RegExp(emailPattern);

    if (!emailRegExp.hasMatch(emailEC.text)) {
      isEmailValid.value = false;
      setFormIsInvalid();
    } else {
      isEmailValid.value = true;
      setFormIsValid();
    }
  }

  setFormIsValid() {
    formIsValid.value = true;
  }

  setFormIsInvalid() {
    formIsValid.value = false;
  }

  navigateToSMS() async {
    ApiProcessorController.warningSnack(
      "This option is not yet available,\nPlease reset via email",
    );

    // Get.offNamed(Routes.resetTxPinViaSms, preventDuplicates: true);
  }

  //=========== Login Methods ===========\\
  onSubmitted(value) {
    if (formIsValid.isTrue) {
      submitEmail();
    }
  }

  Future<void> submitEmail() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (emailEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter your email");
        setFormIsInvalid();
        return;
      } else if (isEmailValid.value == false) {
        ApiProcessorController.warningSnack("Please enter a valid email");
        setFormIsInvalid();
        return;
      }

      isLoading.value = true;
      update();

      var url = ApiUrl.authBaseUrl + ApiUrl.auth + ApiUrl.resetPasswordOTP;

      Map data = {
        "type": "email",
        "email": emailEC.text,
      };

      log("This is the Url: $url");
      log("This is the OTP Data: $data");

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
          ApiProcessorController.successSnack(
            "An OTP has been sent to your email",
          );

          await Future.delayed(const Duration(seconds: 3));

          await Get.to(
            () => const ResetTxPinOTP(),
            arguments: {"resetOptionIsEmail": true},
            routeName: "/reset-tx-pin-otp",
            fullscreenDialog: true,
            curve: Curves.easeInOut,
            preventDuplicates: true,
            popGesture: false,
            transition: Get.defaultTransition,
          );
        } else {
          ApiProcessorController.warningSnack(responseJson["message"]);
          log("Request failed with status: ${response.statusCode}");
          log("Response body: ${response.body}");
        }
      } catch (e) {
        log(e.toString());
      }

      isLoading.value = false;
      update();
    }
  }
}
