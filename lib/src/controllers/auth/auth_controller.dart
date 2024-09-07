import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/auth/signup/screen/signup.dart';

import '../../../app/auth/email_otp/screen/email_otp.dart';
import '../../../app/auth/login/screen/login.dart';
import '../../../app/bottom_nav_view/screen/bottom_navigation_view.dart';
import '../../../app/onboarding/screen/onboarding.dart';
import '../../../main.dart';
import 'user_controller.dart';

class AuthController extends GetxController {
  static AuthController get instance {
    return Get.find<AuthController>();
  }

  var isLoading = false.obs;

  var responseStatus = 0.obs;
  var responseMessage = "".obs;

  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () {
      loadApp();
    });
    super.onInit();
  }

  var userEmail = prefs.getString("userEmail");
  var userPhoneNumber = prefs.getString("phoneNumber");
  var userPassword = prefs.getString("password");

  Future<void> loadApp() async {
    bool isOnboarded = prefs.getBool("isOnboarded") ?? false;
    bool hasNotBeenVerifiedOnSignup =
        prefs.getBool("hasNotBeenVerifiedEmailOnSignup") ?? false;
    bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    bool isLoggedOut = prefs.getBool("isLoggedOut") ?? false;

    if (hasNotBeenVerifiedOnSignup) {
      Get.offAll(
        () => EmailOTP(
          userEmail: userEmail,
          userPhoneNumber: userPhoneNumber,
        ),
        routeName: "/email-otp",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
        arguments: {
          "email": userEmail,
          "phoneNumber": userPhoneNumber,
          "password": userPassword,
        },
      );
    } else if (isLoggedIn) {
      await UserController.instance.getUserProfile();
      await Get.offAll(
        () => const BottomNavigationView(),
        routeName: "/bottom-navigation-view",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
      );
    } else if (!isLoggedIn && isLoggedOut) {
      await Get.offAll(
        () => const Login(),
        routeName: "/login",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
      );
    } else if (isOnboarded) {
      await Get.offAll(
        () => const Signup(),
        routeName: "/signup",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
      );
    } else {
      await Get.offAll(
        () => const Onboarding(),
        routeName: "/onboarding",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
      );
    }
  }
}
