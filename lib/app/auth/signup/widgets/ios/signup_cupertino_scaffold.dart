import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:suitess/app/auth/signup/content/signup_form_page_header.dart';
import 'package:suitess/src/controllers/auth/signup_controller.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';
import '../../../../../src/utils/buttons/ios/cupertino_elevated_button.dart';
import '../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../src/utils/text_form_fields/ios/cupertino_text_field.dart';
import '../../../../../theme/colors.dart';

class SignupCupertinoScaffold extends GetView<SignupController> {
  const SignupCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    final signupController = SignupController.instance;

    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        physics: const PageScrollPhysics(),
        child: Stack(
          children: [
            //Background
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
                          fontSize: 10,
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
            Positioned(
              child: Padding(
                padding: EdgeInsets.only(
                  top: media.height * .22,
                  bottom: 40.0,
                  right: 10,
                  left: 10,
                ),
                child: Container(
                  height: media.height + 200,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorScheme.background,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: .2,
                      color: colorScheme.inversePrimary,
                    ),
                  ),
                  child: Column(
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
                                MyCupertinoTextField(
                                  controller: signupController.emailEC,
                                  focusNode: signupController.emailFN,
                                  textInputAction: TextInputAction.next,
                                  textCapitalization: TextCapitalization.none,
                                  keyboardType: TextInputType.emailAddress,
                                  placeholder: "Email",
                                  onChanged: signupController.emailOnChanged,
                                  validator: (value) {
                                    return null;
                                  },
                                ),
                                kSizedBox,
                                MyCupertinoTextField(
                                  controller: signupController.phoneNumberEC,
                                  focusNode: signupController.phoneNumberFN,
                                  placeholder: "Phone number",
                                  textInputAction: TextInputAction.next,
                                  textCapitalization: TextCapitalization.none,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  borderColor: kTransparentColor,
                                  onChanged:
                                      signupController.phoneNumberOnChanged,
                                  validator: (value) {
                                    return null;
                                  },
                                ),
                                kSizedBox,
                                formFieldContainer(
                                  colorScheme,
                                  media,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: media.width - 100,
                                        child: MyCupertinoTextField(
                                          controller:
                                              signupController.passwordEC,
                                          focusNode:
                                              signupController.passwordFN,
                                          textInputAction: TextInputAction.done,
                                          textCapitalization:
                                              TextCapitalization.none,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          borderColor: kTransparentColor,
                                          obscureText: signupController
                                              .passwordIsHidden.value,
                                          placeholder: "Password",
                                          onChanged: signupController
                                              .passwordOnChanged,
                                          onSubmitted:
                                              signupController.onSubmitted,
                                          validator: (value) {
                                            return null;
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                signupController
                                                        .passwordIsHidden
                                                        .value =
                                                    !signupController
                                                        .passwordIsHidden.value;
                                              },
                                              mouseCursor:
                                                  SystemMouseCursors.click,
                                              tooltip: !signupController
                                                      .passwordIsHidden.value
                                                  ? "Hide password"
                                                  : "Show password",
                                              icon: FaIcon(
                                                color:
                                                    colorScheme.inversePrimary,
                                                size: 18,
                                                signupController
                                                        .passwordIsHidden.value
                                                    ? FontAwesomeIcons.solidEye
                                                    : FontAwesomeIcons
                                                        .solidEyeSlash,
                                              ),
                                            ),
                                            signupController
                                                    .isPasswordValid.value
                                                ? FaIcon(
                                                    FontAwesomeIcons.check,
                                                    color: kSuccessColor,
                                                    size: 14,
                                                  )
                                                : FaIcon(
                                                    FontAwesomeIcons.xmark,
                                                    color: kErrorColor,
                                                    size: 14,
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    signupController.isPasswordValid.value
                                        ? "Password meets the requirements"
                                        : "Password must contain 8 characters,\n a number and\n a special character.",
                                    textAlign: TextAlign.end,
                                    style: defaultTextStyle(
                                      color:
                                          signupController.isPasswordValid.value
                                              ? kSuccessColor
                                              : kErrorColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                kHalfSizedBox,
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: kDefaultPadding * 2),
                      GetBuilder<SignupController>(
                        init: SignupController(),
                        builder: (controller) {
                          return CupertinoElevatedButton(
                            title: "Continue",
                            disable: signupController.formIsValid.isTrue
                                ? false
                                : true,
                            isLoading: signupController.isLoading.value,
                            onPressed: signupController.signup,
                          );
                        },
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
                      GetBuilder<SignupController>(
                        init: SignupController(),
                        builder: (controller) {
                          return CupertinoElevatedButton(
                            title: "Signup with Google",
                            isRowVisible: true,
                            isSwitched: true,
                            disable: signupController.isLoading.value,
                            isLoading:
                                signupController.isLoadingGoogleSignup.value,
                            onPressed: signupController.signupWithGoogle,
                            mainAxisAlignment: MainAxisAlignment.center,
                            buttonColor: colorScheme.primary,
                            textColor: colorScheme.background,
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
                      GetBuilder<SignupController>(
                        init: SignupController(),
                        builder: (controller) {
                          return CupertinoElevatedButton(
                            title: "Signup with Apple",
                            isRowVisible: true,
                            isSwitched: true,
                            disable: signupController.isLoading.value,
                            isLoading:
                                signupController.isLoadingAppleSignup.value,
                            onPressed: signupController.signupWithApple,
                            mainAxisAlignment: MainAxisAlignment.center,
                            buttonColor: colorScheme.primary,
                            textColor: colorScheme.background,
                            rowIconWidget: Image.asset(
                              Assets.appleIconLight,
                              fit: BoxFit.fill,
                              color: colorScheme.background,
                              height: min(60, 30),
                              width: 30,
                            ),
                          );
                        },
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
                                fontSize: 16.0,
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
                                        : kAccentColor,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      kSizedBox,
                    ],
                  ),
                ),
              ),
            ),
            ////////////
          ],
        ),
      ),
    );
  }
}
