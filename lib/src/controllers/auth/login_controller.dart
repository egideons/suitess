import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../app/auth/signup/screen/signup.dart';
import '../../../app/splash/loading/screen/loading_screen.dart';
import '../../../main.dart';
import '../../constants/consts.dart';
import '../../models/auth/login_response_model.dart';
import '../../routes/routes.dart';
import '../../services/api/api_url.dart';
import '../../services/client/http_client_service.dart';
import '../others/api_processor_controller.dart';
import '../others/loading_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance {
    return Get.find<LoginController>();
  }

  var loginResponse = LoginResponseModel.fromJson(null).obs;

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  //=========== Focus nodes ===========\\
  final emailFN = FocusNode();
  final passwordFN = FocusNode();

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var isLoadingGoogleLogin = false.obs;
  var isLoadingAppleLogin = false.obs;
  var isEmailValid = false.obs;
  var isPasswordValid = false.obs;
  var passwordIsHidden = true.obs;
  var formIsValid = false.obs;
  var rememberMe = true.obs;

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
    }

    update();
  }

  passwordOnChanged(value) {
    var passwordRegExp = RegExp(loginPasswordPattern);
    if (isEmailValid.isTrue) {
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

  //=========== Login Methods ===========\\
  onSubmitted(value) {
    if (formIsValid.isTrue) {
      login();
    }
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (emailEC.text.isEmpty) {
        setFormIsInvalid();
        update();
        ApiProcessorController.warningSnack("Please enter your email");
        return;
      } else if (passwordEC.text.isEmpty) {
        setFormIsInvalid();
        update();
        ApiProcessorController.warningSnack("Please enter your password");
        return;
      }

      isLoading.value = true;
      update();

      var url = ApiUrl.authBaseUrl + ApiUrl.auth + ApiUrl.login;

      Map data = {
        "email": emailEC.text,
        "password": passwordEC.text,
      };

      log("This is the Url: $url");
      log("This is the login Data: $data");

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

        // log("This is the response body ====> ${response.body}");

        //Map the response json to the model provided
        loginResponse.value = LoginResponseModel.fromJson(responseJson);
        responseMessage.value = loginResponse.value.message;

        if (response.statusCode == 200) {
          if (rememberMe.value == true) {
            //Save state that the user has logged in
            prefs.setBool("isLoggedIn", true);
          } else {
            prefs.setBool("isLoggedIn", false);
          }

          prefs.setBool("hasNotBeenVerifiedEmailOnSignup", false);

          //Save state that the user token
          await prefs.setString("userToken", loginResponse.value.data.token);

          var userToken = prefs.getString("userToken");

          log("This is the user token: $userToken");

          await Future.delayed(const Duration(seconds: 3));

          //Display Snackbar
          ApiProcessorController.successSnack("Login successful");

          await Get.offAll(
            () => LoadingScreen(
              loadData: LoadingController.instance.loadHome,
            ),
            routeName: "/loading-screen",
            fullscreenDialog: true,
            curve: Curves.easeInOut,
            predicate: (routes) => false,
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
    }
    isLoading.value = false;
    update();
  }

  //=========== Continue with Google ===========\\
  var scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  Future<void> loginWithGoogle() async {
    isLoadingGoogleLogin.value = true;
    update();

    await Future.delayed(const Duration(seconds: 2));

    // GoogleSignIn googleSignIn = GoogleSignIn(
    //   // Optional clientId
    //   clientId:
    //       '537371602886-o25rom5lvbl8f39i46ft2clv7jm1pvet.apps.googleusercontent.com',
    //   scopes: scopes,
    // );

    try {
      //Sign in silently
      // var gUser = await googleSignIn.signInSilently();

      // if (gUser == null) {
      //   try {
      //     var gUser = await googleSignIn.signIn();

      //     if (gUser == null) {
      //       log("Google sign-in cancelled");
      //       isLoadingGoogleLogin.value = false;
      //       update();
      //       return; // Exit the function
      //     }

      //     var gAuth = await gUser.authentication;

      //     final credential = GoogleAuthProvider.credential(
      //       accessToken: gAuth.accessToken,
      //       idToken: gAuth.idToken,
      //     );

      //     await FirebaseAuth.instance.signInWithCredential(credential);
      //     ApiProcessorController.successSnack("Login successful");

      //     await Get.offAll(
      //       () => LoadingScreen(
      //         loadData:
      //             LoadingController.instance.loadHome,
      //       ),
      //       routeName: "/loading-screen",
      //       fullscreenDialog: true,
      //       curve: Curves.easeInOut,
      //       predicate: (routes) => false,
      //       popGesture: false,
      //       transition: Get.defaultTransition,
      //     );
      //   } on SocketException {
      //     ApiProcessorController.warningSnack("Please connect to the internet");
      //   } on PlatformException catch (e) {
      //     // Handle specific platform exceptions
      //     log("Google sign-in failed: ${e.message}");
      //     ApiProcessorController.warningSnack("$e");
      //     // You can display an error message to the user or handle the error accordingly
      //     isLoadingGoogleLogin.value = false;
      //     update();
      //   } catch (error) {
      //     // Handle other types of errors
      //     log("Error during Google sign-in: $error");
      //     ApiProcessorController.warningSnack("$error");
      //     // You can display an error message to the user or handle the error accordingly
      //     isLoadingGoogleLogin.value = false;
      //     update();
      //   }
      //   isLoadingGoogleLogin.value = false;
      //   update();
      //   return; // Exit the function
      // }

      // var gAuth = await gUser.authentication;

      // final credential = GoogleAuthProvider.credential(
      //   accessToken: gAuth.accessToken,
      //   idToken: gAuth.idToken,
      // );

      // await FirebaseAuth.instance.signInWithCredential(credential);

      // ApiProcessorController.successSnack("Login successful");

      // if (rememberMe.value == true) {
      //   //Save state that the user has logged in
      //   prefs.setBool("isLoggedIn", true);
      // } else {
      //   prefs.setBool("isLoggedIn", false);
      // }

      // prefs.setBool("hasBeenVerifiedEmailOnSignup", true);

      // await Get.offAll(
      //   () => LoadingScreen(
      //     loadData: LoadingController.instance.loadHome,
      //   ),
      //   routeName: "/loading-screen",
      //   fullscreenDialog: true,
      //   curve: Curves.easeInOut,
      //   predicate: (routes) => false,
      //   popGesture: false,
      //   transition: Get.defaultTransition,
      // );

      isLoadingGoogleLogin.value = false;
      update();
    } on SocketException {
      ApiProcessorController.warningSnack("Please connect to the internet");
    } on PlatformException catch (e) {
      // Handle specific platform exceptions
      log("Google sign-in failed: ${e.message}");
      log("Google sign-up failed: ${e.message}");
      // You can display an error message to the user or handle the error accordingly
      isLoadingGoogleLogin.value = false;
      update();
    } catch (error) {
      // Handle other types of errors
      log("Error during Google sign-in: $error");
      ApiProcessorController.warningSnack("$error");
      // You can display an error message to the user or handle the error accordingly
      isLoadingGoogleLogin.value = false;
      update();
    }
  }

  //=========== Continue with Apple ===========\\

  Future<void> loginWithApple() async {
    isLoadingAppleLogin.value = true;
    update();

    await Future.delayed(const Duration(milliseconds: 500));

    try {
      // ApiProcessorController.successSnack("Login successful");

      isLoadingAppleLogin.value = false;
      update();
      // } on Exception {
      //   isLoadingAppleLogin.value = false;
      //   update();
      //   throw Exception;
    } catch (error) {
      log(error.toString());
    }
    isLoadingAppleLogin.value = false;
    update();
  }

  navigateToSignup() {
    // Navigate to Home() screen
    Get.offAll(
      () => const Signup(),
      routeName: "/signup",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }

  navigateToForgotPassword() {
    // Navigate to Home() screen
    // Get.toNamed(Routes.forgotPassword, preventDuplicates: true);
    Get.toNamed(Routes.resetPasswordViaEmail, preventDuplicates: true);
  }
}
