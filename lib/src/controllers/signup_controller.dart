import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kribb/src/controllers/api_processor_controller.dart';

import '../../app/auth/email_otp/screen/email_otp.dart';
import '../../app/auth/login/screen/login.dart';
import '../constants/consts.dart';

class SignupController extends GetxController {
  static SignupController get instance {
    return Get.find<SignupController>();
  }

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
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
      setFormIsInvalid();
    } else {
      isFirstNameValid.value = true;
    }
    update();
  }

  lastNameOnChanged(value) {
    var userNameRegExp = RegExp(namePattern);
    if (isFirstNameValid.isTrue) {
      if (!userNameRegExp.hasMatch(lastNameEC.text)) {
        isLastNameValid.value = false;
        setFormIsInvalid();
      } else {
        isLastNameValid.value = true;
      }
    } else {
      isLastNameValid.value = false;
      setFormIsInvalid();
    }
    update();
  }

  emailOnChanged(value) {
    var emailRegExp = RegExp(emailPattern);
    if (isLastNameValid.isTrue) {
      if (!emailRegExp.hasMatch(emailEC.text)) {
        isEmailValid.value = false;
        setFormIsInvalid();
      } else {
        isEmailValid.value = true;
      }
    } else {
      isEmailValid.value = false;
      setFormIsInvalid();
    }
    update();
  }

  phoneNumberOnChanged(value) {
    var phoneNumberRegExp = RegExp(mobilePattern);
    if (isEmailValid.isTrue) {
      if (!phoneNumberRegExp.hasMatch(phoneNumberEC.text)) {
        isPhoneNumberValid.value = false;
        setFormIsInvalid();
      } else {
        isPhoneNumberValid.value = true;
      }
    } else {
      isPhoneNumberValid.value = false;
      setFormIsInvalid();
    }
    update();
  }

  passwordOnChanged(value) {
    var passwordRegExp = RegExp(passwordPattern);
    if (isPhoneNumberValid.isTrue) {
      if (!passwordRegExp.hasMatch(passwordEC.text)) {
        isPasswordValid.value = false;
        setFormIsInvalid();
      } else {
        isPasswordValid.value = true;
        setFormIsValid();
        update();
      }
    } else {
      isPasswordValid.value = false;
      setFormIsInvalid();
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
        setFormIsInvalid();
        update();
        ApiProcessorController.errorSnack("Please enter your first name");
        return;
      } else if (lastNameEC.text.isEmpty) {
        setFormIsInvalid();
        update();
        ApiProcessorController.errorSnack("Please enter your last name");
        return;
      } else if (emailEC.text.isEmpty) {
        setFormIsInvalid();
        update();
        ApiProcessorController.errorSnack("Please enter your email");
        return;
      } else if (phoneNumberEC.text.isEmpty) {
        setFormIsInvalid();
        update();
        ApiProcessorController.errorSnack("Please enter your phone number");
        return;
      } else if (passwordEC.text.isEmpty) {
        setFormIsInvalid();
        update();
        ApiProcessorController.errorSnack("Please enter your password");
        return;
      }

      isLoading.value = true;
      update();

      await Future.delayed(const Duration(seconds: 3));

      ApiProcessorController.successSnack("Signup successful");

      Get.offAll(
        () => const EmailOTP(),
        routeName: "/email-otp",
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

    GoogleSignIn googleSignIn = GoogleSignIn(
      // Optional clientId
      clientId:
          '537371602886-o25rom5lvbl8f39i46ft2clv7jm1pvet.apps.googleusercontent.com',
      scopes: scopes,
    );

    try {
      var gUser = await googleSignIn.signIn();

      if (gUser == null) {
        isLoadingGoogleSignup.value = false;
        log("Google sign-up cancelled");
        update();
        return; // Exit the function
      }

      var gAuth = await gUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      ApiProcessorController.successSnack("Signup successful");

      Get.offAll(
        () => const EmailOTP(),
        routeName: "/email-otp",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
      );

      isLoadingGoogleSignup.value = false;
      update();
    } on SocketException {
      ApiProcessorController.errorSnack("Please connect to the internet");
    } on PlatformException catch (e) {
      // Handle specific platform exceptions
      log("Google sign-up failed: ${e.message}");
      // You can display an error message to the user or handle the error accordingly
      isLoadingGoogleSignup.value = false;
      update();
    } catch (error) {
      // Handle other types of errors
      log("Error during Google sign-up: $error");
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
