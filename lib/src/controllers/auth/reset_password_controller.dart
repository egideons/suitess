import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:suitess/src/controllers/others/api_processor_controller.dart';

import '../../../app/auth/login/screen/login.dart';
import '../../constants/consts.dart';
import '../../services/api/api_url.dart';
import '../../services/client/client_service.dart';

class ResetPasswordController extends GetxController {
  static ResetPasswordController get instance {
    return Get.find<ResetPasswordController>();
  }

  var otpCode = Get.parameters['otpCode'] ?? '';
  var phone = Get.parameters['phone'] ?? '';
  var email = Get.parameters['email'] ?? '';
  var isPhoneOTP = Get.arguments?['isPhoneOTP'] ?? false;

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
    var passwordRegExp = RegExp(passwordPattern);

    if (!passwordRegExp.hasMatch(passwordEC.text)) {
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
        ApiProcessorController.errorSnack("Please enter your password");
        return;
      } else if (confirmPasswordEC.text.isEmpty) {
        ApiProcessorController.errorSnack("Please confirm your password");
        return;
      } else if (confirmPasswordEC.text != passwordEC.text) {
        ApiProcessorController.errorSnack("Passwords do not match");
        return;
      }
      isLoading.value = true;
      update();

      if (isPhoneOTP == true) {
        isLoading.value = false;
        update();

        // Get.offAll(
        //   () => const Login(),
        //   routeName: "/login",
        //   fullscreenDialog: true,
        //   curve: Curves.easeInOut,
        //   predicate: (routes) => false,
        //   popGesture: false,
        //   transition: Get.defaultTransition,
        // );
      } else {
        var url =
            ApiUrl.baseUrl + ApiUrl.auth + ApiUrl.resetPasswordUpdatePassword;

        Map data = {
          "type": "email",
          "email": email,
          "password": passwordEC.text,
          "password_confirmation": confirmPasswordEC.text,
          "otp": otpCode
        };

        log("This is the Url: $url");
        log("This is the phone otp Data: $data");

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
            // resetPasswordResponse.value =
            //     ResetPasswordResponseModel.fromJson(responseJson);

            ApiProcessorController.successSnack(
              "Password reset successful",
            );

            Get.offAll(
              () => const Login(),
              routeName: "/login",
              fullscreenDialog: true,
              curve: Curves.easeInOut,
              predicate: (routes) => false,
              popGesture: false,
              transition: Get.defaultTransition,
            );
          } else {
            // ApiProcessorController.errorSnack(otpResponse.value.message);
            log("Request failed with status: ${response.statusCode}");
            log("Response body: ${response.data}");
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
