import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/src/utils/buttons/android/android_outlined_button.dart';
import 'package:suitess/src/utils/components/responsive_constants.dart';
import 'package:suitess/src/utils/containers/form_field_container.dart';
import 'package:suitess/src/utils/text_form_fields/android/android_textformfield.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/auth/signup_controller.dart';
import '../../../../../theme/colors.dart';
import '../../content/signup_form_page_header.dart';
import '../../content/signup_page_header.dart';

class SignupScaffold extends GetView<SignupController> {
  const SignupScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
                    child: signupPageHeader(),
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
                                formFieldContainer(
                                  colorScheme,
                                  media,
                                  containerHeight: media.height * .08,
                                  child: AndroidTextFormField(
                                    controller: signupController.firstNameEC,
                                    focusNode: signupController.firstNameFN,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.name,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    hintText: "First Name",
                                    onChanged:
                                        signupController.firstNameOnChanged,
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                                kSizedBox,
                                formFieldContainer(
                                  colorScheme,
                                  media,
                                  containerHeight: media.height * .08,
                                  child: AndroidTextFormField(
                                    hintText: "Last Name",
                                    controller: signupController.lastNameEC,
                                    focusNode: signupController.lastNameFN,
                                    textInputAction: TextInputAction.next,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    keyboardType: TextInputType.name,
                                    onChanged:
                                        signupController.lastNameOnChanged,
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                                kSizedBox,
                                formFieldContainer(
                                  colorScheme,
                                  media,
                                  containerHeight: media.height * .08,
                                  child: AndroidTextFormField(
                                    controller: signupController.emailEC,
                                    focusNode: signupController.emailFN,
                                    textInputAction: TextInputAction.next,
                                    textCapitalization: TextCapitalization.none,
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: "Email",
                                    onChanged: signupController.emailOnChanged,
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                                kSizedBox,
                                formFieldContainer(
                                  colorScheme,
                                  media,
                                  containerHeight: media.height * .08,
                                  child: AndroidTextFormField(
                                    controller: signupController.phoneNumberEC,
                                    focusNode: signupController.phoneNumberFN,
                                    hintText: "Phone number",
                                    textInputAction: TextInputAction.next,
                                    textCapitalization: TextCapitalization.none,
                                    keyboardType: TextInputType.phone,
                                    onChanged:
                                        signupController.phoneNumberOnChanged,
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                                kSizedBox,
                                formFieldContainer(
                                  colorScheme,
                                  media,
                                  containerHeight: media.height * .08,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: AndroidTextFormField(
                                          controller:
                                              signupController.passwordEC,
                                          focusNode:
                                              signupController.passwordFN,
                                          textInputAction: TextInputAction.done,
                                          textCapitalization:
                                              TextCapitalization.none,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obscureText: signupController
                                              .passwordIsHidden.value,
                                          hintText: "Password",
                                          onChanged: signupController
                                              .passwordOnChanged,
                                          onFieldSubmitted:
                                              signupController.onSubmitted,
                                          validator: (value) {
                                            return null;
                                          },
                                        ),
                                      ),
                                      InkWell(
                                        borderRadius: BorderRadius.circular(20),
                                        onTap: () {
                                          signupController
                                                  .passwordIsHidden.value =
                                              !signupController
                                                  .passwordIsHidden.value;
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            color: colorScheme.inversePrimary,
                                            size: 14,
                                            signupController
                                                    .passwordIsHidden.value
                                                ? Iconsax.eye4
                                                : Iconsax.eye_slash5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    signupController.isTypingPassword.isFalse
                                        ? ""
                                        : signupController.isPasswordValid.value
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
              signupPageHeader(),
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
                              formFieldContainer(
                                colorScheme,
                                media,
                                child: AndroidTextFormField(
                                  controller: signupController.firstNameEC,
                                  focusNode: signupController.firstNameFN,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  textCapitalization: TextCapitalization.words,
                                  hintText: "First Name",
                                  onChanged:
                                      signupController.firstNameOnChanged,
                                  validator: (value) {
                                    return null;
                                  },
                                ),
                              ),
                              kSizedBox,
                              formFieldContainer(
                                colorScheme,
                                media,
                                child: AndroidTextFormField(
                                  hintText: "Last Name",
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
                              ),
                              kSizedBox,
                              formFieldContainer(
                                colorScheme,
                                media,
                                child: AndroidTextFormField(
                                  controller: signupController.emailEC,
                                  focusNode: signupController.emailFN,
                                  textInputAction: TextInputAction.next,
                                  textCapitalization: TextCapitalization.none,
                                  keyboardType: TextInputType.emailAddress,
                                  hintText: "Email",
                                  onChanged: signupController.emailOnChanged,
                                  validator: (value) {
                                    return null;
                                  },
                                ),
                              ),
                              kSizedBox,
                              formFieldContainer(
                                colorScheme,
                                media,
                                child: AndroidTextFormField(
                                  controller: signupController.phoneNumberEC,
                                  focusNode: signupController.phoneNumberFN,
                                  hintText: "Phone number",
                                  textInputAction: TextInputAction.next,
                                  textCapitalization: TextCapitalization.none,
                                  keyboardType: TextInputType.phone,
                                  onChanged:
                                      signupController.phoneNumberOnChanged,
                                  validator: (value) {
                                    return null;
                                  },
                                ),
                              ),
                              kSizedBox,
                              formFieldContainer(
                                colorScheme,
                                media,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: AndroidTextFormField(
                                        controller: signupController.passwordEC,
                                        focusNode: signupController.passwordFN,
                                        textInputAction: TextInputAction.done,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText: signupController
                                            .passwordIsHidden.value,
                                        hintText: "Password",
                                        onChanged:
                                            signupController.passwordOnChanged,
                                        onFieldSubmitted:
                                            signupController.onSubmitted,
                                        validator: (value) {
                                          return null;
                                        },
                                      ),
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      onTap: () {
                                        signupController
                                                .passwordIsHidden.value =
                                            !signupController
                                                .passwordIsHidden.value;
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          color: colorScheme.inversePrimary,
                                          size: 14,
                                          signupController
                                                  .passwordIsHidden.value
                                              ? Iconsax.eye4
                                              : Iconsax.eye_slash5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  signupController.isTypingPassword.isFalse
                                      ? ""
                                      : signupController.isPasswordValid.value
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
