import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suitess/main.dart';
import 'package:suitess/src/controllers/others/api_processor_controller.dart';

import '../../../app/auth/email_otp/screen/email_otp.dart';
import '../../../app/auth/login/screen/login.dart';
import '../../constants/consts.dart';
import '../../models/auth/signup_response_model.dart';
import '../../services/api/api_url.dart';
import '../../services/client/http_client_service.dart';

class SignupController extends GetxController {
  static SignupController get instance {
    return Get.find<SignupController>();
  }

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
  final scrollController = ScrollController();
  final firstNameEC = TextEditingController();
  final lastNameEC = TextEditingController();
  final emailEC = TextEditingController();
  final phoneNumberEC = TextEditingController();
  final passwordEC = TextEditingController();

  //=========== Focus nodes ===========\\
  final firstNameFN = FocusNode();
  final lastNameFN = FocusNode();
  final emailFN = FocusNode();
  final phoneNumberFN = FocusNode();
  final passwordFN = FocusNode();

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var isLoadingGoogleSignup = false.obs;
  var isLoadingAppleSignup = false.obs;
  var isFirstNameValid = false.obs;
  var isLastNameValid = false.obs;
  var isEmailValid = false.obs;
  var isPhoneNumberValid = false.obs;
  var isPasswordValid = false.obs;
  var passwordIsHidden = true.obs;
  var formIsValid = false.obs;
  var isTypingPassword = false.obs;

  //=========== Variables ===========\\
  var responseStatus = 0.obs;
  var responseMessage = "".obs;
  var ngnDialCode = "+234".obs;
  var signupResponse = SignupResponseModel.fromJson(null).obs;

  //=========== onChanged Functions ===========\\
  firstNameOnChanged(value) {
    var userNameRegExp = RegExp(namePattern);
    if (!userNameRegExp.hasMatch(firstNameEC.text)) {
      isFirstNameValid.value = false;
    } else {
      isFirstNameValid.value = true;
    }
    update();
  }

  lastNameOnChanged(value) {
    var userNameRegExp = RegExp(namePattern);
    if (!userNameRegExp.hasMatch(lastNameEC.text)) {
      isLastNameValid.value = false;
    } else {
      isLastNameValid.value = true;
    }
    update();
  }

  emailOnChanged(value) {
    var emailRegExp = RegExp(emailPattern);
    if (!emailRegExp.hasMatch(emailEC.text)) {
      isEmailValid.value = false;
    } else {
      isEmailValid.value = true;
    }
    update();
  }

  phoneNumberOnChanged(value) {
    var phoneNumberRegExp = RegExp(mobilePattern);
    if (!phoneNumberRegExp.hasMatch(phoneNumberEC.text)) {
      isPhoneNumberValid.value = false;
    } else {
      isPhoneNumberValid.value = true;
    }
    update();
  }

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

  setFormIsValid() {
    formIsValid.value = true;
  }

  setFormIsInvalid() {
    formIsValid.value = false;
  }

  //=========== Signup Methods ===========\\
  onSubmitted(value) {
    if (formIsValid.isTrue) {
      signup();
    }
  }

  Future<void> signup() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (firstNameEC.text.isEmpty) {
        ApiProcessorController.errorSnack("Please enter your first name");
        return;
      } else if (isFirstNameValid.value == false) {
        ApiProcessorController.errorSnack("Please enter a valid name");
        return;
      } else if (lastNameEC.text.isEmpty) {
        ApiProcessorController.errorSnack("Please enter your last name");
        return;
      } else if (isLastNameValid.value == false) {
        ApiProcessorController.errorSnack("Please enter a valid name");
        return;
      } else if (emailEC.text.isEmpty) {
        ApiProcessorController.errorSnack("Please enter your email");
        return;
      } else if (isEmailValid.value == false) {
        ApiProcessorController.errorSnack("Please enter a valid email");
        return;
      } else if (phoneNumberEC.text.isEmpty) {
        ApiProcessorController.errorSnack("Please enter your phone number");
        return;
      } else if (isPhoneNumberValid.value == false) {
        ApiProcessorController.errorSnack("Please enter a valid phone number");
        return;
      } else if (passwordEC.text.isEmpty) {
        ApiProcessorController.errorSnack("Please enter your password");
        return;
      } else if (isPasswordValid.value == false) {
        ApiProcessorController.errorSnack("Please enter a valid password");
        return;
      }

      isLoading.value = true;
      update();

      var url = ApiUrl.baseUrl + ApiUrl.auth + ApiUrl.register;

      Map signupData = {
        "fullname": "${firstNameEC.text} ${lastNameEC.text}",
        "phone": phoneNumberEC.text,
        "email": emailEC.text,
        "password": passwordEC.text,
        "password_confirmation": passwordEC.text,
      };

      log("This is the Url: $url");
      log("This is the Signup Data: $signupData");

      //HTTP Client Service
      http.Response? response =
          await HttpClientService.postRequest(url, null, signupData);

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

        //Map the response json to the model provided
        signupResponse.value = SignupResponseModel.fromJson(responseJson);

        log("This is the response body ====> ${response.body}");

        responseMessage.value = signupResponse.value.message;

        if (response.statusCode == 200) {
          // Convert the map to a JSON string
          String signupDataString = jsonEncode(signupData);

          prefs.setString("signupData", signupDataString);

          // Get.offAll(
          //   () => PhoneOTP(userPhoneNumber: phoneNumberEC.text),
          //   routeName: "/phone-otp",
          //   fullscreenDialog: true,
          //   curve: Curves.easeInOut,
          //   predicate: (routes) => false,
          //   popGesture: false,
          //   transition: Get.defaultTransition,
          // );
          Get.offAll(
            () => EmailOTP(userEmail: emailEC.text),
            routeName: "/email-otp",
            fullscreenDialog: true,
            curve: Curves.easeInOut,
            predicate: (routes) => false,
            arguments: {"email": emailEC.text},
            popGesture: false,
            transition: Get.defaultTransition,
          );
        } else {
          ApiProcessorController.errorSnack(responseMessage.value);
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

  //=========== Continue with Google ===========\\
  var scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  Future<void> signupWithGoogle() async {
    isLoadingGoogleSignup.value = true;
    update();

    await Future.delayed(const Duration(milliseconds: 500));

    // GoogleSignIn googleSignIn = GoogleSignIn(
    //   // Optional clientId
    //   clientId:
    //       '537371602886-o25rom5lvbl8f39i46ft2clv7jm1pvet.apps.googleusercontent.com',
    //   scopes: scopes,
    // );

    try {
      // var gUser = await googleSignIn.signIn();

      // if (gUser == null) {
      //   log("Google sign-up cancelled");
      //   isLoadingGoogleSignup.value = false;
      //   update();
      //   return; // Exit the function
      // }

      // var gAuth = await gUser.authentication;

      // final credential = GoogleAuthProvider.credential(
      //   accessToken: gAuth.accessToken,
      //   idToken: gAuth.idToken,
      // );

      // await FirebaseAuth.instance.signInWithCredential(credential);

      // ApiProcessorController.successSnack("Signin successful");

      // Get.offAll(
      //   () => const EmailOTP(),
      //   routeName: "/email-otp",
      //   fullscreenDialog: true,
      //   curve: Curves.easeInOut,
      //   predicate: (routes) => false,
      //   popGesture: false,
      //   transition: Get.defaultTransition,
      // );

      isLoadingGoogleSignup.value = false;
      update();
    } on SocketException {
      ApiProcessorController.errorSnack("Please connect to the internet");
    } on PlatformException catch (e) {
      // Handle specific platform exceptions
      log("Google sign-up failed: ${e.message}");
      ApiProcessorController.errorSnack("$e");
      // You can display an error message to the user or handle the error accordingly
      isLoadingGoogleSignup.value = false;
      update();
    } catch (error) {
      // Handle other types of errors
      log("Error during Google sign-up: $error");
      ApiProcessorController.errorSnack("$error");
      // You can display an error message to the user or handle the error accordingly
      isLoadingGoogleSignup.value = false;
      update();
    }
  }

  //=========== Continue with Apple ===========\\

  Future<void> signupWithApple() async {
    isLoadingAppleSignup.value = true;
    update();

    await Future.delayed(const Duration(milliseconds: 500));

    try {
      isLoadingAppleSignup.value = false;
      update();
      // } on Exception {
      //   isLoadingAppleSignup.value = false;
      //   update();
      //   throw Exception;
    } catch (error) {
      log(error.toString());
    }
    isLoadingAppleSignup.value = false;
    update();
  }

  //=========== Navigate to Login ===========\\
  navigateToLogin() {
    // Navigate to Home() screen
    Get.offAll(
      () => const Login(),
      routeName: "/login",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }
}
