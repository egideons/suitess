import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/src/utils/components/responsive_constants.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/controllers/auth/login_controller.dart';
import '../../../../../src/utils/buttons/android/android_outlined_button.dart';
import '../../../../../theme/colors.dart';
import '../../content/login_form_landscape.dart';
import '../../content/login_form_mobile.dart';
import '../../content/login_page_form_header.dart';
import '../../content/login_page_header.dart';

class LoginScaffold extends GetView<LoginController> {
  const LoginScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    final loginController = LoginController.instance;

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
                  //Background Image
                  Image.asset(
                    Assets.authPng,
                    width: media.width,
                    height: media.height,
                    fit: BoxFit.cover,
                  ),

                  //Welcome back Text
                  Center(
                    child: loginPageHeader(),
                  ),
                ],
              ),
            ),
            kHalfWidthSizedBox,

            //Login Form
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  // decoration: BoxDecoration(
                  //   color: colorScheme.surface,
                  //   borderRadius: BorderRadius.circular(12),
                  //   border: Border.all(
                  //     width: .2,
                  //     color: colorScheme.inversePrimary,
                  //   ),
                  // ),
                  child: Column(
                    children: [
                      loginFormPageHeader(
                        colorScheme: colorScheme,
                        media: media,
                      ),
                      kSizedBox,
                      Obx(
                        () {
                          return loginFormLandscape(
                              loginController, colorScheme, media);
                        },
                      ),
                      Obx(
                        () {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox.adaptive(
                                    value: loginController.rememberMe.value,
                                    activeColor: colorScheme.secondary,
                                    checkColor: kWhiteBackgroundColor,
                                    side: BorderSide(
                                      width: .6,
                                      color: colorScheme.primary,
                                    ),
                                    onChanged: (value) {
                                      loginController.rememberMe.value =
                                          !loginController.rememberMe.value;
                                    },
                                  ),
                                  Text(
                                    "Remember me",
                                    textAlign: TextAlign.start,
                                    style: defaultTextStyle(
                                      fontSize: 12,
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                              RichText(
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                softWrap: true,
                                text: TextSpan(
                                  text: "Forgot Password?",
                                  style: defaultTextStyle(
                                    color: colorScheme.primary,
                                    fontSize: 12,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = loginController.isLoading.value
                                        ? null
                                        : loginController
                                            .navigateToForgotPassword,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: kDefaultPadding * 2),
                      GetBuilder<LoginController>(
                        init: LoginController(),
                        builder: (context) {
                          return AndroidElevatedButton(
                            title: "Login",
                            disable:
                                !loginController.isLoadingGoogleLogin.value &&
                                        loginController.formIsValid.isTrue
                                    ? false
                                    : true,
                            isLoading: loginController.isLoading.value,
                            onPressed: loginController.login,
                          );
                        },
                      ),
                      kSizedBox,
                      Obx(
                        () => Align(
                          alignment: Alignment.center,
                          child: Text.rich(
                            TextSpan(
                              text: "Don't have an account? ",
                              style: defaultTextStyle(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                              ),
                              children: [
                                TextSpan(
                                  text: "Sign up",
                                  mouseCursor: SystemMouseCursors.click,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = loginController.isLoading.value
                                        ? null
                                        : loginController.navigateToSignup,
                                  style: defaultTextStyle(
                                    color: loginController.isLoading.value
                                        ? colorScheme.inversePrimary
                                        : colorScheme.secondary,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      kSizedBox,
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
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
                      GetBuilder<LoginController>(
                        init: LoginController(),
                        builder: (controller) {
                          return AndroidOutlinedButton(
                            title: "Continue with Google",
                            isRowVisible: true,
                            isSwitched: true,
                            disable: loginController.isLoading.value ||
                                loginController.isLoadingGoogleLogin.value,
                            isLoading:
                                loginController.isLoadingGoogleLogin.value,
                            onPressed: loginController.loginWithGoogle,
                            buttonColor: colorScheme.surface,
                            textColor: colorScheme.primary,
                            fontWeight: FontWeight.w500,
                            mainAxisAlignment: MainAxisAlignment.center,
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
              // Welcome back Text
              loginPageHeader(colorScheme: colorScheme, media: media),
            ],
          ),

          //Login Form
          Padding(
            padding: EdgeInsets.only(
              top: media.height * .22,
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
                    loginFormPageHeader(
                      colorScheme: colorScheme,
                      media: media,
                    ),
                    kSizedBox,
                    Obx(
                      () {
                        return loginFormMobile(
                          loginController,
                          colorScheme,
                          media,
                        );
                      },
                    ),
                    kSizedBox,
                    Obx(
                      () {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox.adaptive(
                                  value: loginController.rememberMe.value,
                                  activeColor: colorScheme.secondary,
                                  checkColor: kWhiteBackgroundColor,
                                  side: BorderSide(
                                    width: .6,
                                    color: colorScheme.primary,
                                  ),
                                  onChanged: (value) {
                                    loginController.rememberMe.value =
                                        !loginController.rememberMe.value;
                                  },
                                ),
                                Text(
                                  "Remember me",
                                  textAlign: TextAlign.start,
                                  style: defaultTextStyle(
                                    fontSize: 12,
                                    color: colorScheme.primary,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            RichText(
                              textAlign: TextAlign.end,
                              maxLines: 1,
                              softWrap: true,
                              text: TextSpan(
                                text: "Forgot Password?",
                                style: defaultTextStyle(
                                  color: colorScheme.primary,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w400,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = loginController.isLoading.value ||
                                          controller.isLoadingGoogleLogin.value
                                      ? null
                                      : loginController
                                          .navigateToForgotPassword,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: kDefaultPadding * 2),
                    GetBuilder<LoginController>(
                      init: LoginController(),
                      builder: (context) {
                        return AndroidElevatedButton(
                          title: "Login",
                          disable: !loginController.formIsValid.value ||
                              loginController.isLoading.value ||
                              loginController.isLoadingGoogleLogin.value,
                          isLoading: loginController.isLoading.value,
                          onPressed: loginController.login,
                        );
                      },
                    ),
                    kSizedBox,
                    Obx(
                      () => Align(
                        alignment: Alignment.center,
                        child: Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            style: defaultTextStyle(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                            children: [
                              TextSpan(
                                text: "Sign up",
                                mouseCursor: SystemMouseCursors.click,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = loginController.isLoading.value ||
                                          loginController
                                              .isLoadingGoogleLogin.value
                                      ? null
                                      : loginController.navigateToSignup,
                                style: defaultTextStyle(
                                  color: loginController.isLoading.value
                                      ? colorScheme.inversePrimary
                                      : colorScheme.secondary,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    kSizedBox,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
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
                    GetBuilder<LoginController>(
                      init: LoginController(),
                      builder: (controller) {
                        return AndroidOutlinedButton(
                          title: "Continue with Google",
                          isRowVisible: true,
                          isSwitched: true,
                          disable: loginController.isLoading.value ||
                              loginController.isLoadingGoogleLogin.value,
                          isLoading: loginController.isLoadingGoogleLogin.value,
                          onPressed: loginController.loginWithGoogle,
                          buttonColor: colorScheme.surface,
                          textColor: colorScheme.primary,
                          fontWeight: FontWeight.w500,
                          mainAxisAlignment: MainAxisAlignment.center,
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
