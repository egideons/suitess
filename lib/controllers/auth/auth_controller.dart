import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/android/auth/signup/screen/android_signup_screen.dart';

import '../../../app/android/auth/email_otp/screen/android_email_otp.dart';
import '../../../app/android/auth/login/screen/android_login.dart';
import '../../../app/android/bottom_nav_view/screen/android_bottom_navigation_view.dart';
import '../../../app/android/onboarding/screen/onboarding.dart';
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
        () => AndroidEmailOTP(
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
        () => const AndroidBottomNavigationView(),
        routeName: "/bottom-navigation-view",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
      );
    } else if (!isLoggedIn && isLoggedOut) {
      await Get.offAll(
        () => const AndroidLoginScreen(),
        routeName: "/login",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
      );
    } else if (isOnboarded) {
      await Get.offAll(
        () => const AndroidSignupScreen(),
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
