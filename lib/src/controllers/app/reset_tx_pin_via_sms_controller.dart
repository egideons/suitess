import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../app/auth/reset_password_otp/via_sms/screen/reset_password_via_sms_otp.dart';
import '../../constants/consts.dart';
import '../../models/auth/verify_otp_response_model.dart';
import '../../routes/routes.dart';
import '../../services/api/api_url.dart';
import '../../services/client/http_client_service.dart';
import '../others/api_processor_controller.dart';

class ResetTxPinViaSmsController extends GetxController {
  static ResetTxPinViaSmsController get instance {
    return Get.find<ResetTxPinViaSmsController>();
  }

  @override
  void onInit() {
    phoneNumberFN.requestFocus();
    super.onInit();
  }

  var otpResponse = VerifyOTPResponseModel.fromJson(null).obs;

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
  final phoneNumberEC = TextEditingController();

  //=========== Focus nodes ===========\\
  final phoneNumberFN = FocusNode();

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var isPhoneNumberValid = false.obs;
  var formIsValid = false.obs;
  var responseStatus = 0.obs;
  var responseMessage = "".obs;

  //=========== onChanged Functions ===========\\

  phoneNumberOnChanged(value) {
    var phoneNumberRegExp = RegExp(mobilePattern);
    if (!phoneNumberRegExp.hasMatch(phoneNumberEC.text)) {
      isPhoneNumberValid.value = false;
      setFormIsInvalid();
    } else {
      isPhoneNumberValid.value = true;
      setFormIsValid();
    }
    update();
  }

  setFormIsValid() {
    formIsValid.value = true;
  }

  setFormIsInvalid() {
    formIsValid.value = false;
  }

  navigateToEmail() async {
    Get.offNamed(Routes.resetPasswordViaEmail, preventDuplicates: true);
  }

  //=========== Login Methods ===========\\
  onSubmitted(value) {
    if (formIsValid.isTrue) {
      submitPhoneNumber();
    }
  }

  Future<void> submitPhoneNumber() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (phoneNumberEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter your phone number");
        setFormIsInvalid();
        return;
      } else if (isPhoneNumberValid.value == false) {
        ApiProcessorController.warningSnack(
            "Please enter a valid phone number");
        setFormIsInvalid();
        return;
      }

      isLoading.value = true;
      update();

      var url = ApiUrl.authBaseUrl + ApiUrl.auth + ApiUrl.resetPasswordOTP;

      Map data = {
        "type": "phone",
        "phone": phoneNumberEC.text,
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
        responseMessage.value = otpResponse.value.message;
        if (response.statusCode == 200) {
          ApiProcessorController.successSnack(
            "An OTP has been sent to your email",
          );

          log("This is the response body ====> ${response.body}");

          //Map the response json to the model provided
          otpResponse.value = VerifyOTPResponseModel.fromJson(responseJson);

          ApiProcessorController.successSnack(
            "An OTP has been sent to your phone number",
          );
          await Get.to(
            () => ResetPasswordViaSMSOTP(userPhoneNumber: phoneNumberEC.text),
            routeName: "/reset-password-via-sms-otp",
            fullscreenDialog: true,
            curve: Curves.easeInOut,
            preventDuplicates: true,
            popGesture: false,
            transition: Get.defaultTransition,
          );
        } else {
          ApiProcessorController.warningSnack(responseMessage.value);
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
