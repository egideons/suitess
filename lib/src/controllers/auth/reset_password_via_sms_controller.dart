import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/consts.dart';
import '../../models/auth/verify_email_otp_response_model.dart';
import '../../routes/routes.dart';
import '../others/api_processor_controller.dart';

class ResetPasswordViaSMSController extends GetxController {
  static ResetPasswordViaSMSController get instance {
    return Get.find<ResetPasswordViaSMSController>();
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
        ApiProcessorController.errorSnack("Please enter your phone number");
        setFormIsInvalid();
        return;
      } else if (isPhoneNumberValid.value == false) {
        ApiProcessorController.errorSnack("Please enter a valid phone number");
        setFormIsInvalid();
        return;
      }

      isLoading.value = true;
      update();

      ApiProcessorController.errorSnack(
        "This option is not yet available,\nPlease reset via email",
      );

      // var url = ApiUrl.baseUrl + ApiUrl.auth + ApiUrl.resetPasswordOTP;

      // Map data = {
      //   "type": "phone",
      //   "phone": phoneNumberEC.text,
      // };

      // log("This is the Url: $url");
      // log("This is the OTP Data: $data");

      // // Client service
      // var response = await ClientService.postRequest(
      //   url,
      //   data,
      // );

      // if (response == null) {
      //   isLoading.value = false;
      //   update();
      //   return;
      // }

      // try {
      //   if (response.statusCode == 200) {
      //     // Convert to json
      //     dynamic responseJson;
      //     if (response.data is String) {
      //       responseJson = jsonDecode(response.data);
      //     } else {
      //       responseJson = response.data;
      //     }

      //     log("This is the response body ====> ${response.data}");

      //     //Map the response json to the model provided
      //     otpResponse.value = VerifyOTPResponseModel.fromJson(responseJson);

      //     ApiProcessorController.successSnack(
      //       "An OTP has been sent to your phone number",
      //     );
      //     await Get.to(
      //       () => ResetPasswordViaSMSOTP(userPhoneNumber: phoneNumberEC.text),
      //       routeName: "/reset-password-via-sms-otp",
      //       fullscreenDialog: true,
      //       curve: Curves.easeInOut,
      //       preventDuplicates: true,
      //       popGesture: false,
      //       transition: Get.defaultTransition,
      //     );
      //   } else {
      //     log("Request failed with status: ${response.statusCode}");
      //     log("Response body: ${response.data}");
      //   }
      // } catch (e) {
      //   log(e.toString());
      // }

      isLoading.value = false;
      update();
    }
  }
}
