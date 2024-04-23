import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/app/auth/components/auth_cupertino_nav_bar.dart';
import 'package:kribb/app/auth/signup/content/signup_page_header.dart';
import 'package:kribb/src/constants/consts.dart';
import 'package:kribb/src/controllers/signup_controller.dart';
import 'package:kribb/src/utils/buttons/ios/cupertino_elevated_button.dart';
import 'package:kribb/theme/colors.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../src/utils/text_form_fields/ios/cupertino_text_field.dart';

class SignupCupertinoScaffold extends GetView<SignupController> {
  const SignupCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    final signupController = SignupController.instance;

    return CupertinoPageScaffold(
      navigationBar: authCupertinoNavBar(
        colorScheme: colorScheme,
        media: media,
        title: "Create account",
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            signupPageHeader(colorScheme: colorScheme, media: media),
            const SizedBox(height: kDefaultPadding * 2),
            Obx(
              () {
                return Form(
                  key: signupController.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      formFieldContainer(
                        colorScheme,
                        media,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media.width - 60,
                              child: MyCupertinoTextField(
                                controller: signupController.firstNameEC,
                                focusNode: signupController.firstNameFN,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                textCapitalization: TextCapitalization.words,
                                borderColor: kTransparentColor,
                                placeholder: "First Name",
                                onChanged: signupController.firstNameOnChanged,
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: signupController.isFirstNameValid.value
                                  ? FaIcon(
                                      FontAwesomeIcons.solidCircleCheck,
                                      color: kSuccessColor,
                                    )
                                  : FaIcon(
                                      FontAwesomeIcons.solidCircleXmark,
                                      color: kErrorColor,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      kSizedBox,
                      formFieldContainer(
                        colorScheme,
                        media,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media.width - 60,
                              child: MyCupertinoTextField(
                                placeholder: "Last Name",
                                controller: signupController.lastNameEC,
                                focusNode: signupController.lastNameFN,
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.words,
                                borderColor: kTransparentColor,
                                keyboardType: TextInputType.name,
                                onChanged: signupController.lastNameOnChanged,
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: signupController.isLastNameValid.value
                                  ? FaIcon(
                                      FontAwesomeIcons.solidCircleCheck,
                                      color: kSuccessColor,
                                    )
                                  : FaIcon(
                                      FontAwesomeIcons.solidCircleXmark,
                                      color: kErrorColor,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      kSizedBox,
                      formFieldContainer(
                        colorScheme,
                        media,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media.width - 60,
                              child: MyCupertinoTextField(
                                controller: signupController.emailEC,
                                focusNode: signupController.emailFN,
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.emailAddress,
                                borderColor: kTransparentColor,
                                placeholder: "Email",
                                onChanged: signupController.emailOnChanged,
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: signupController.isEmailValid.value
                                  ? FaIcon(
                                      FontAwesomeIcons.solidCircleCheck,
                                      color: kSuccessColor,
                                    )
                                  : FaIcon(
                                      FontAwesomeIcons.solidCircleXmark,
                                      color: kErrorColor,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      kSizedBox,
                      formFieldContainer(
                        colorScheme,
                        media,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media.width - 60,
                              child: MyCupertinoTextField(
                                // prefix: Padding(
                                //   padding: const EdgeInsets.only(left: 10.0),
                                //   child: Text(
                                //     signupController.ngnDialCode.value,
                                //     style: defaultTextStyle(),
                                //   ),
                                // ),
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
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: signupController.isPhoneNumberValid.value
                                  ? FaIcon(
                                      FontAwesomeIcons.solidCircleCheck,
                                      color: kSuccessColor,
                                    )
                                  : FaIcon(
                                      FontAwesomeIcons.solidCircleXmark,
                                      color: kErrorColor,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      kSizedBox,
                      formFieldContainer(
                        colorScheme,
                        media,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media.width - 100,
                              child: MyCupertinoTextField(
                                controller: signupController.passwordEC,
                                focusNode: signupController.passwordFN,
                                textInputAction: TextInputAction.done,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.visiblePassword,
                                borderColor: kTransparentColor,
                                obscureText:
                                    signupController.passwordIsHidden.value,
                                placeholder: "Password",
                                onChanged: signupController.passwordOnChanged,
                                onSubmitted: signupController.onSubmitted,
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      signupController.passwordIsHidden.value =
                                          !signupController
                                              .passwordIsHidden.value;
                                    },
                                    mouseCursor: SystemMouseCursors.click,
                                    tooltip:
                                        !signupController.passwordIsHidden.value
                                            ? "Hide password"
                                            : "Show password",
                                    icon: FaIcon(
                                      color: colorScheme.inversePrimary,
                                      size: 18,
                                      signupController.passwordIsHidden.value
                                          ? FontAwesomeIcons.solidEye
                                          : FontAwesomeIcons.solidEyeSlash,
                                    ),
                                  ),
                                  signupController.isPasswordValid.value
                                      ? FaIcon(
                                          FontAwesomeIcons.solidCircleCheck,
                                          color: kSuccessColor,
                                        )
                                      : FaIcon(
                                          FontAwesomeIcons.solidCircleXmark,
                                          color: kErrorColor,
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
                              : "Password must contain 8 characters, a number and a special character",
                          textAlign: TextAlign.end,
                          style: defaultTextStyle(
                            color: signupController.isPasswordValid.value
                                ? kSuccessColor
                                : kErrorColor,
                            fontSize: 12.0,
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
                  disable: signupController.formIsValid.isTrue ? false : true,
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
            Obx(
              () => CupertinoElevatedButton(
                disable: false,
                title: "Continue with Google",
                isRowVisible: true,
                isSwitched: true,
                mainAxisAlignment: MainAxisAlignment.center,
                buttonIconWidget: Image.asset(
                  Assets.googleIcon,
                  fit: BoxFit.fill,
                  height: min(60, 20),
                  width: 20,
                ),
                buttonColor: colorScheme.primary,
                textColor: colorScheme.background,
                onPressed: signupController.isLoading.value
                    ? null
                    : signupController.signupWithGoogle,
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
          ],
        ),
      ),
    );
  }
}