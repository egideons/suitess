import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/screens/profile/views/password/content/change_password_modal_sheet.dart';
import '../../constants/consts.dart';
import '../../services/api/api_url.dart';
import '../others/api_processor_controller.dart';

class PasswordSettingsController extends GetxController {
  static PasswordSettingsController get instance {
    return Get.find<PasswordSettingsController>();
  }

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
  final currentPasswordEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  //=========== Focus nodes ===========\\
  final currentPasswordFN = FocusNode();
  final passwordFN = FocusNode();
  final confirmPasswordFN = FocusNode();

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var isPasswordValid = false.obs;
  var isConfirmPasswordValid = false.obs;
  var currentPasswordIsHidden = true.obs;
  var passwordIsHidden = true.obs;
  var confirmPasswordIsHidden = true.obs;
  var formIsValid = false.obs;
  var isTypingPassword = false.obs;

  showChangePasswordModalSheet() async {
    var media = MediaQuery.of(Get.context!).size;
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      useSafeArea: true,
      constraints:
          BoxConstraints(maxHeight: media.height, maxWidth: media.width),
      builder: (context) {
        return GestureDetector(
          onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
          child: const ChangePasswordModalSheet(),
        );
      },
    );
  }

  //=========== On Changed ===========\\
  currentPasswordOnChanged(String value) {
    var passwordRegExp = RegExp(passwordPattern);

    if (!passwordRegExp.hasMatch(passwordEC.text) &&
        isTypingPassword.value == true) {
      isPasswordValid.value = false;
      setFormIsInvalid();
    } else {
      isPasswordValid.value = true;
      setFormIsValid();
    }
  }

  passwordOnChanged(String value) {
    var passwordRegExp = RegExp(passwordPattern);

    // Check if the text field is empty
    if (value.isEmpty) {
      isTypingPassword.value = false;
    } else {
      isTypingPassword.value = true;
    }

    if (!passwordRegExp.hasMatch(passwordEC.text) &&
        isTypingPassword.value == true) {
      isPasswordValid.value = false;
      setFormIsInvalid();
    } else {
      isPasswordValid.value = true;
      setFormIsValid();
    }
  }

  confirmPasswordOnChanged(String value) {
    var passwordRegExp = RegExp(passwordPattern);

    if (!passwordRegExp.hasMatch(passwordEC.text)) {
      isConfirmPasswordValid.value = false;
      setFormIsInvalid();
    } else {
      isConfirmPasswordValid.value = true;
      setFormIsValid();
    }
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
      updatePassword();
    }
  }

  Future<void> updatePassword() async {
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

      var url = ApiUrl.authBaseUrl + ApiUrl.auth + ApiUrl.updatePassword;

      Map data = {
        "current_password": currentPasswordEC.text,
        "new_password": passwordEC.text,
        "new_password_confirmation": confirmPasswordEC.text,
      };

      log("This is the Url: $url");
      log("This is the phone otp Data: $data");

      //HTTP Client Service
      // http.Response? response =
      //     await HttpClientService.postRequest(url, null, data);

      //Dio Client Service
      // var response = await DioClientService.postRequest(
      //   url,
      //   data,
      // );
      // if (response == null) {
      //   isLoading.value = false;
      //
      //   return;
      // }

      ApiProcessorController.successSnack(
        "Password reset successfully \n(FAKE RESPONSE MESSAGE!!)",
      );

      // try {
      //   // Convert to json
      //   dynamic responseJson;
      //   responseJson = jsonDecode(response.body);

      //   log("This is the response body ====> ${response.body}");
      //   // Map the response json to the model provided
      //   // resetPasswordResponse.value =
      //   //     ResetPasswordResponseModel.fromJson(responseJson);
      //   if (response.statusCode == 200) {
      //     ApiProcessorController.successSnack(
      //       "Password reset successfully",
      //     );

      //     Get.offAll(
      //       () => const Login(),
      //       routeName: "/login",
      //       fullscreenDialog: true,
      //       curve: Curves.easeInOut,
      //       predicate: (routes) => false,
      //       popGesture: false,
      //       transition: Get.defaultTransition,
      //     );
      //   } else {
      //     ApiProcessorController.errorSnack(
      //         resetPasswordResponse.value.message);
      //     log("Request failed with status: ${response.statusCode}");
      //     log("Response body: ${response.body}");
      //   }
      // } catch (e) {
      //   log(e.toString());
      // }

      isLoading.value = false;
    }
  }
}
