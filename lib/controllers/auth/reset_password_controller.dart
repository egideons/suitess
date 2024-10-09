import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suitess/src/controllers/others/api_processor_controller.dart';

import '../../../app/android/auth/login/screen/android_login.dart';
import '../../constants/consts.dart';
import '../../models/auth/reset_password_response_model.dart';
import '../../services/api/api_url.dart';
import '../../services/client/http_client_service.dart';

class ResetPasswordController extends GetxController {
  static ResetPasswordController get instance {
    return Get.find<ResetPasswordController>();
  }

  var otpCode = Get.parameters['otpCode'] ?? '';
  var phone = Get.parameters['phone'] ?? '';
  var email = Get.parameters['email'] ?? '';
  var isPhoneOTP = Get.arguments?['isPhoneOTP'] ?? false;
  var resetPasswordResponse = ResetPasswordResponseModel.fromJson(null).obs;

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  //=========== Focus nodes ===========\\
  final passwordFN = FocusNode();
  final confirmPasswordFN = FocusNode();

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var isPasswordValid = false.obs;
  var isConfirmPasswordValid = false.obs;
  var passwordIsHidden = true.obs;
  var confirmPasswordIsHidden = true.obs;
  var formIsValid = false.obs;
  var isTypingPassword = false.obs;

  //=========== passwordOnChanged ===========\\
  passwordOnChanged(value) {
    var passwordRegExp = RegExp(passwordPattern);

    // Check if the text field is empty
    if (value.isEmpty) {
      isTypingPassword.value = false;
    } else {
      isTypingPassword.value = true;
    }

    update();

    if (!passwordRegExp.hasMatch(passwordEC.text) &&
        isTypingPassword.value == true) {
      isPasswordValid.value = false;
      setFormIsInvalid();
    } else {
      isPasswordValid.value = true;
      setFormIsValid();
      update();
    }

    update();
  }

  confirmPasswordOnChanged(value) {
    if (confirmPasswordEC.text == passwordEC.text) {
      isConfirmPasswordValid.value = false;
      setFormIsInvalid();
    } else {
      isConfirmPasswordValid.value = true;
      setFormIsValid();
      update();
    }

    update();
  }

  setFormIsValid() {
    formIsValid.value = true;
  }

  setFormIsInvalid() {
    formIsValid.value = false;
  }

  //=========== Submit ===========\\
  onSubmitted(value) {
    if (formIsValid.isTrue) {
      resetPassword();
    }
  }

  Future<void> resetPassword() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (passwordEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please enter your password");
        return;
      } else if (confirmPasswordEC.text.isEmpty) {
        ApiProcessorController.warningSnack("Please confirm your password");
        return;
      } else if (confirmPasswordEC.text != passwordEC.text) {
        ApiProcessorController.warningSnack("Passwords do not match");
        return;
      }
      isLoading.value = true;
      update();

      if (isPhoneOTP == true) {
        isLoading.value = false;
        update();

        // Get.offAll(
        //   () => const AndroidLoginScreen(),
        //   routeName: "/login",
        //   fullscreenDialog: true,
        //   curve: Curves.easeInOut,
        //   predicate: (routes) => false,
        //   popGesture: false,
        //   transition: Get.defaultTransition,
        // );
      } else {
        var url = ApiUrl.authBaseUrl +
            ApiUrl.auth +
            ApiUrl.resetPasswordUpdatePassword;

        Map data = {
          "type": "email",
          "email": email,
          "password": passwordEC.text,
          "password_confirmation": confirmPasswordEC.text,
          "otp": otpCode
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
          update();
          return;
        }

        try {
          // Convert to json
          dynamic responseJson;
          responseJson = jsonDecode(response.body);

          log("This is the response body ====> ${response.body}");
          // Map the response json to the model provided
          resetPasswordResponse.value =
              ResetPasswordResponseModel.fromJson(responseJson);
          if (response.statusCode == 200) {
            ApiProcessorController.successSnack(
              "Password reset successfully",
            );

            Get.offAll(
              () => const AndroidLoginScreen(),
              routeName: "/login",
              fullscreenDialog: true,
              curve: Curves.easeInOut,
              predicate: (routes) => false,
              popGesture: false,
              transition: Get.defaultTransition,
            );
          } else {
            ApiProcessorController.warningSnack(
                resetPasswordResponse.value.message);
            log("Request failed with status: ${response.statusCode}");
            log("Response body: ${response.body}");
          }
        } catch (e) {
          log(e.toString());
        }
      }
      isLoading.value = false;
      update();
    }
  }
}
