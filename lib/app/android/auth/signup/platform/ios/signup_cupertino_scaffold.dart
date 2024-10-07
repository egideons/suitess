import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suitess/app/android/auth/signup/content/signup_form_page_header.dart';
import 'package:suitess/src/controllers/auth/signup_controller.dart';
import 'package:suitess/src/utils/components/responsive_constants.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/utils/buttons/ios/cupertino_elevated_button.dart';
import '../../../../../../src/utils/text_form_fields/ios/cupertino_text_field.dart';
import '../../../../../../theme/colors.dart';

class SignupCupertinoScaffold extends GetView<SignupController> {
  const SignupCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    final signupController = SignupController.instance;

    if (deviceType(media.width) > 1) {
      return CupertinoPageScaffold(
        child: Row(
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
                    child: Container(
                      height: 250.0,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome to suitess",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 4,
                            style: defaultTextStyle(
                              fontSize: 24,
                              color: kTextWhiteColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            "Let's get you started",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 4,
                            style: defaultTextStyle(
                              fontSize: 12,
                              color: kTextWhiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            kWidthSizedBox,
            kHalfWidthSizedBox,
            //Signup Form
            Container(
              width: media.width / 2.4,
              margin: const EdgeInsets.only(left: 12, right: 12),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: .2,
                      color: colorScheme.inversePrimary,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(height: kDefaultPadding * 4),
                      signupFormPageHeader(
                        colorScheme: colorScheme,
                        media: media,
                      ),
                      kSizedBox,
                      Obx(
                        () {
                          return Form(
                            key: signupController.formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                MyCupertinoTextField(
                                  controller: signupController.firstNameEC,
                                  focusNode: signupController.firstNameFN,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  textCapitalization: TextCapitalization.words,
                                  placeholder: "First Name",
                                  onChanged:
                                      signupController.firstNameOnChanged,
                                  validator: (value) {
                                    return null;
                                  },
                                ),
                                kSizedBox,
                                MyCupertinoTextField(
                                  placeholder: "Last Name",
                                  controller: signupController.lastNameEC,
                                  focusNode: signupController.lastNameFN,
                                  textInputAction: TextInputAction.next,
                                  textCapitalization: TextCapitalization.words,
                                  keyboardType: TextInputType.name,
                                  onChanged: signupController.lastNameOnChanged,
                                  validator: (value) {
                                    return null;
                                  },
                                ),
                                kSizedBox,
                                // MyCupertinoTextField(
                                //   controller: signupController.emailEC,
                                //   focusNode: signupController.emailFN,
                                //   textInputAction: TextInputAction.next,
                                //   textCapitalization: TextCapitalization.none,
                                //   keyboardType: TextInputType.emailAddress,
                                //   placeholder: "Email",
                                //   onChanged: signupController.emailOnChanged,
                                //   validator: (value) {
                                //     return null;
                                //   },
                                // ),
                                // kSizedBox,
                                MyCupertinoTextField(
                                  controller: signupController.phoneNumberEC,
                                  focusNode: signupController.phoneNumberFN,
                                  placeholder: "Phone number",
                                  textInputAction: TextInputAction.next,
                                  textCapitalization: TextCapitalization.none,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(),
                                  onChanged:
                                      signupController.phoneNumberOnChanged,
                                  validator: (value) {
                                    return null;
                                  },
                                ),
                                kSizedBox,
                                MyCupertinoTextField(
                                  controller: signupController.passwordEC,
                                  focusNode: signupController.passwordFN,
                                  textInputAction: TextInputAction.done,
                                  textCapitalization: TextCapitalization.none,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText:
                                      signupController.passwordIsHidden.value,
                                  placeholder: "Password",
                                  onChanged: signupController.passwordOnChanged,
                                  onSubmitted: signupController.onSubmitted,
                                  validator: (value) {
                                    return null;
                                  },
                                  suffixMode: OverlayVisibilityMode.always,
                                  suffix: GestureDetector(
                                    onTap: () {
                                      signupController.passwordIsHidden.value =
                                          !signupController
                                              .passwordIsHidden.value;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        color: colorScheme.inversePrimary,
                                        size: 14,
                                        signupController.passwordIsHidden.value
                                            ? Iconsax.eye4
                                            : Iconsax.eye_slash5,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    signupController.isPasswordValid.value
                                        ? "Password meets the requirements"
                                        : "Password must contain 8 characters\n a number\n a special character.",
                                    textAlign: TextAlign.end,
                                    style: defaultTextStyle(
                                      color:
                                          signupController.isPasswordValid.value
                                              ? kSuccessColor
                                              : kErrorColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      kSizedBox,
                      SizedBox(
                        width: media.width,
                        child: GetBuilder<SignupController>(
                          init: SignupController(),
                          builder: (controller) {
                            return CupertinoElevatedButton(
                              title: "Continue",
                              isLoading: signupController.isLoading.value,
                              onPressed: signupController.signup,
                              disable: signupController.formIsValid.isTrue
                                  ? false
                                  : true,
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
                                        : colorScheme.secondary,
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
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: .4,
                                color: colorScheme.primary,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: CupertinoElevatedButton(
                              title: "Continue with Google",
                              isRowVisible: true,
                              isSwitched: true,
                              disable: signupController.isLoading.value,
                              isLoading:
                                  signupController.isLoadingGoogleSignup.value,
                              onPressed: signupController.signupWithGoogle,
                              mainAxisAlignment: MainAxisAlignment.center,
                              buttonColor: colorScheme.surface,
                              textColor: colorScheme.primary,
                              fontWeight: FontWeight.w400,
                              rowIconWidget: Image.asset(
                                Assets.googleIcon,
                                fit: BoxFit.fill,
                                height: min(60, 20),
                                width: 20,
                              ),
                            ),
                          );
                        },
                      ),
                      kSizedBox,
                      GetBuilder<SignupController>(
                        init: SignupController(),
                        builder: (controller) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: .4,
                                color: colorScheme.primary,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: CupertinoElevatedButton(
                              title: "Continue with Apple",
                              isRowVisible: true,
                              isSwitched: true,
                              disable: signupController.isLoading.value,
                              isLoading:
                                  signupController.isLoadingAppleSignup.value,
                              onPressed: signupController.signupWithApple,
                              mainAxisAlignment: MainAxisAlignment.center,
                              buttonColor: colorScheme.surface,
                              textColor: colorScheme.primary,
                              rowIconWidget: Image.asset(
                                Get.isDarkMode
                                    ? Assets.appleIconLight
                                    : Assets.appleIconDark,
                                fit: BoxFit.fill,
                                height: min(60, 20),
                                width: 20,
                              ),
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
    return CupertinoPageScaffold(
      child: Stack(
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
              // Welcome Text
              Container(
                height: 250.0,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to suitess",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      style: defaultTextStyle(
                        fontSize: 24,
                        color: kTextWhiteColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "Let's get you started",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      style: defaultTextStyle(
                        fontSize: 12,
                        color: kTextWhiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
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
                  border: Border.all(
                    width: .2,
                    color: colorScheme.inversePrimary,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: kDefaultPadding * 4),
                    signupFormPageHeader(
                      colorScheme: colorScheme,
                      media: media,
                    ),
                    kSizedBox,
                    Obx(
                      () {
                        return Form(
                          key: signupController.formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              MyCupertinoTextField(
                                controller: signupController.firstNameEC,
                                focusNode: signupController.firstNameFN,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                placeholder: "First Name",
                                onChanged: signupController.firstNameOnChanged,
                                validator: (value) {
                                  return null;
                                },
                              ),
                              kSizedBox,
                              MyCupertinoTextField(
                                placeholder: "Last Name",
                                controller: signupController.lastNameEC,
                                focusNode: signupController.lastNameFN,
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.words,
                                keyboardType: TextInputType.name,
                                onChanged: signupController.lastNameOnChanged,
                                validator: (value) {
                                  return null;
                                },
                              ),
                              kSizedBox,
                              // MyCupertinoTextField(
                              //   controller: signupController.emailEC,
                              //   focusNode: signupController.emailFN,
                              //   textInputAction: TextInputAction.next,
                              //   textCapitalization: TextCapitalization.none,
                              //   keyboardType: TextInputType.emailAddress,
                              //   placeholder: "Email",
                              //   onChanged: signupController.emailOnChanged,
                              //   validator: (value) {
                              //     return null;
                              //   },
                              // ),
                              // kSizedBox,
                              MyCupertinoTextField(
                                controller: signupController.phoneNumberEC,
                                focusNode: signupController.phoneNumberFN,
                                placeholder: "Phone number",
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.phone,
                                onChanged:
                                    signupController.phoneNumberOnChanged,
                                validator: (value) {
                                  return null;
                                },
                              ),
                              kSizedBox,
                              MyCupertinoTextField(
                                controller: signupController.passwordEC,
                                focusNode: signupController.passwordFN,
                                textInputAction: TextInputAction.done,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText:
                                    signupController.passwordIsHidden.value,
                                placeholder: "Password",
                                onChanged: signupController.passwordOnChanged,
                                onSubmitted: signupController.onSubmitted,
                                validator: (value) {
                                  return null;
                                },
                                suffixMode: OverlayVisibilityMode.always,
                                suffix: GestureDetector(
                                  onTap: () {
                                    signupController.passwordIsHidden.value =
                                        !signupController
                                            .passwordIsHidden.value;
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      color: colorScheme.inversePrimary,
                                      size: 14,
                                      signupController.passwordIsHidden.value
                                          ? Iconsax.eye4
                                          : Iconsax.eye_slash5,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  signupController.isPasswordValid.value
                                      ? "Password meets the requirements"
                                      : "Password must contain 8 characters\n a number\n a special character.",
                                  textAlign: TextAlign.end,
                                  style: defaultTextStyle(
                                    color:
                                        signupController.isPasswordValid.value
                                            ? kSuccessColor
                                            : kErrorColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    kSizedBox,
                    SizedBox(
                      width: media.width,
                      child: GetBuilder<SignupController>(
                        init: SignupController(),
                        builder: (controller) {
                          return CupertinoElevatedButton(
                            title: "Create account",
                            isLoading: signupController.isLoading.value,
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
                        return Container(
                          width: media.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: .4,
                              color: colorScheme.primary,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CupertinoElevatedButton(
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
                          ),
                        );
                      },
                    ),
                    kSizedBox,
                    GetBuilder<SignupController>(
                      init: SignupController(),
                      builder: (controller) {
                        return Container(
                          width: media.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: .4,
                              color: colorScheme.primary,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CupertinoElevatedButton(
                            title: "Continue with Apple",
                            isRowVisible: true,
                            isSwitched: true,
                            disable: signupController.isLoading.value ||
                                signupController.isLoadingGoogleSignup.value ||
                                signupController.isLoadingAppleSignup.value,
                            isLoading:
                                signupController.isLoadingAppleSignup.value,
                            onPressed: signupController.signupWithApple,
                            mainAxisAlignment: MainAxisAlignment.center,
                            buttonColor: colorScheme.surface,
                            textColor: colorScheme.primary,
                            fontWeight: FontWeight.w500,
                            rowIconWidget: Image.asset(
                              Get.isDarkMode
                                  ? Assets.appleIconLight
                                  : Assets.appleIconDark,
                              fit: BoxFit.fill,
                              height: min(60, 20),
                              width: 20,
                            ),
                          ),
                        );
                      },
                    ),
                    kSizedBox,
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
