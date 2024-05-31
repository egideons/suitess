import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suitess/src/controllers/others/api_processor_controller.dart';

import '../../../app/auth/login/screen/login.dart';
import '../../../app/auth/phone_otp/screen/phone_otp.dart';
import '../../constants/consts.dart';

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

  //=========== Variables ===========\\
  var responseStatus = 0.obs;
  var responseMessage = "".obs;
  var ngnDialCode = "+234".obs;

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
    // var emailRegExp = RegExp(emailPattern);
    // if (!emailRegExp.hasMatch(emailEC.text)) {
    if (emailEC.text.isEmail) {
      isEmailValid.value = true;
    } else {
      isEmailValid.value = false;
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

    if (!passwordRegExp.hasMatch(passwordEC.text)) {
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
      }
      //  else if (emailEC.text.isEmpty) {
      //   ApiProcessorController.errorSnack("Please enter your email");
      //   return;
      // } else if (isEmailValid.value == false) {
      //   ApiProcessorController.errorSnack("Please enter a valid email");
      //   return;
      // }
      else if (phoneNumberEC.text.isEmpty) {
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

      await Future.delayed(const Duration(seconds: 3));

      ApiProcessorController.successSnack("Signup successful");

      Get.offAll(
        () => const PhoneOTP(),
        routeName: "/phone-otp",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
      );
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
      //   () => const PhoneOTP(),
      //   routeName: "/phone-otp",
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
