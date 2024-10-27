import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/utils/buttons/android/android_outlined_button.dart';
import 'package:suitess/utils/components/responsive_constants.dart';
import 'package:suitess/views/android/auth/signup/content/android_signup_form_page_header.dart';

import '../../../../../constants/assets.dart';
import '../../../../../constants/consts.dart';
import '../../../../../controllers/auth/signup_controller.dart';
import '../../../../../theme/colors.dart';
import 'android_signup_form_landscape.dart';
import 'android_signup_form_mobile.dart';
import 'android_signup_page_header.dart';

class AndroidSignupScaffold extends GetView<SignupController> {
  const AndroidSignupScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    final signupController = SignupController.instance;

    //Mobile Landscape mode or Large screens
    if (deviceType(media.width) > 1) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: media.width / 2.1,
              child: Stack(
                children: [
                  // Background Image
                  Image.asset(
                    Assets.authPng,
                    width: media.width,
                    height: media.height,
                    fit: BoxFit.cover,
                  ),
                  // Welcome Text
                  Center(
                    child: androidSignupPageHeader(),
                  ),
                ],
              ),
            ),
            kHalfWidthSizedBox,

            //Signup Form
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  // decoration: BoxDecoration(
                  //   color: colorScheme.surface,
                  //   borderRadius: BorderRadius.circular(12),
                  //   border: Border.all(
                  //     width: .6,
                  //     color: colorScheme.inversePrimary,
                  //   ),
                  // ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      androidSignupFormPageHeader(
                        colorScheme: colorScheme,
                        media: media,
                      ),
                      kSizedBox,
                      Obx(
                        () {
                          return androidSignupFormLandscape(
                            signupController,
                            colorScheme,
                            media,
                          );
                        },
                      ),
                      kSizedBox,
                      SizedBox(
                        width: media.width,
                        child: GetBuilder<SignupController>(
                          init: SignupController(),
                          builder: (controller) {
                            return AndroidElevatedButton(
                              title: "Create account",
                              isLoading: signupController.isLoading.value,
                              buttonColor: kSuccessColor,
                              onPressed: signupController.signup,
                              disable: !signupController.formIsValid.value ||
                                  signupController.isLoading.value ||
                                  signupController
                                      .isLoadingGoogleSignup.value ||
                                  signupController.isLoadingAppleSignup.value,
                            );
                          },
                        ),
                      ),
                      kSizedBox,
                      Obx(
                        () => Align(
                          alignment: Alignment.center,
                          child: Text.rich(
                            TextSpan(
                              text: "Already have an account? ",
                              style: defaultTextStyle(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w300,
                                fontSize: 14.0,
                              ),
                              children: [
                                TextSpan(
                                  text: "Login",
                                  mouseCursor: SystemMouseCursors.click,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = signupController.isLoading.value
                                        ? null
                                        : signupController.navigateToLogin,
                                  style: defaultTextStyle(
                                    color: signupController.isLoading.value
                                        ? colorScheme.inversePrimary
                                        : kSuccessColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      kSizedBox,
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Container(
                                color: colorScheme.inversePrimary,
                                height: .5,
                              ),
                            ),
                            kHalfWidthSizedBox,
                            Text(
                              "Or",
                              textAlign: TextAlign.center,
                              style: defaultTextStyle(
                                fontSize: 14.0,
                                color: colorScheme.inversePrimary,
                              ),
                            ),
                            kHalfWidthSizedBox,
                            Flexible(
                              child: Container(
                                color: colorScheme.inversePrimary,
                                height: .5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      kSizedBox,
                      GetBuilder<SignupController>(
                        init: SignupController(),
                        builder: (controller) {
                          return AndroidOutlinedButton(
                            title: "Continue with Google",
                            isRowVisible: true,
                            isSwitched: true,
                            disable: signupController.isLoading.value ||
                                signupController.isLoadingGoogleSignup.value ||
                                signupController.isLoadingAppleSignup.value,
                            isLoading:
                                signupController.isLoadingGoogleSignup.value,
                            onPressed: signupController.signupWithGoogle,
                            mainAxisAlignment: MainAxisAlignment.center,
                            buttonColor: colorScheme.surface,
                            textColor: colorScheme.primary,
                            fontWeight: FontWeight.w500,
                            rowIconWidget: Image.asset(
                              Assets.googleIcon,
                              fit: BoxFit.fill,
                              height: min(60, 20),
                              width: 20,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    //Portrait mode for mobile screens
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          //Background Image with Heading
          Stack(
            children: [
              // Background Image
              Image.asset(
                Assets.authPng,
                width: media.width,
                fit: BoxFit.fill,
                height: media.height * .4,
              ),
              //Welcome Text
              androidSignupPageHeader(),
            ],
          ),

          //Signup Form
          Padding(
            padding: EdgeInsets.only(
              top: media.height * .22,
              bottom: 40.0,
              right: 10,
              left: 10,
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: kDefaultPadding * 4),
                    androidSignupFormPageHeader(
                      colorScheme: colorScheme,
                      media: media,
                    ),
                    kSizedBox,
                    Obx(
                      () {
                        return androidSignupFormMobile(
                          signupController,
                          colorScheme,
                          media,
                        );
                      },
                    ),
                    kSizedBox,
                    SizedBox(
                      width: media.width,
                      child: GetBuilder<SignupController>(
                        init: SignupController(),
                        builder: (controller) {
                          return AndroidElevatedButton(
                            title: "Create account",
                            isLoading: signupController.isLoading.value,
                            buttonColor: kSuccessColor,
                            onPressed: signupController.signup,
                            disable: !signupController.formIsValid.value ||
                                signupController.isLoading.value ||
                                signupController.isLoadingGoogleSignup.value ||
                                signupController.isLoadingAppleSignup.value,
                          );
                        },
                      ),
                    ),
                    kSizedBox,
                    Obx(
                      () => Align(
                        alignment: Alignment.center,
                        child: Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            style: defaultTextStyle(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w300,
                              fontSize: 14.0,
                            ),
                            children: [
                              TextSpan(
                                text: "Login",
                                mouseCursor: SystemMouseCursors.click,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = signupController.isLoading.value ||
                                          signupController
                                              .isLoadingGoogleSignup.value
                                      ? null
                                      : signupController.navigateToLogin,
                                style: defaultTextStyle(
                                  color: signupController.isLoading.value
                                      ? colorScheme.inversePrimary
                                      : kSuccessColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    kSizedBox,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Container(
                              color: colorScheme.inversePrimary,
                              height: .5,
                            ),
                          ),
                          kHalfWidthSizedBox,
                          Text(
                            "Or",
                            textAlign: TextAlign.center,
                            style: defaultTextStyle(
                              fontSize: 14.0,
                              color: colorScheme.inversePrimary,
                            ),
                          ),
                          kHalfWidthSizedBox,
                          Flexible(
                            child: Container(
                              color: colorScheme.inversePrimary,
                              height: .5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    kSizedBox,
                    GetBuilder<SignupController>(
                      init: SignupController(),
                      builder: (controller) {
                        return AndroidOutlinedButton(
                          title: "Continue with Google",
                          isRowVisible: true,
                          isSwitched: true,
                          disable: signupController.isLoading.value ||
                              signupController.isLoadingGoogleSignup.value ||
                              signupController.isLoadingAppleSignup.value,
                          isLoading:
                              signupController.isLoadingGoogleSignup.value,
                          onPressed: signupController.signupWithGoogle,
                          mainAxisAlignment: MainAxisAlignment.center,
                          buttonColor: colorScheme.surface,
                          textColor: colorScheme.primary,
                          fontWeight: FontWeight.w500,
                          rowIconWidget: Image.asset(
                            Assets.googleIcon,
                            fit: BoxFit.fill,
                            height: min(60, 20),
                            width: 20,
                          ),
                        );
                      },
                    ),
                    kSizedBox,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
