import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/app/auth/signup/content/auth_cupertino_nav_bar.dart';
import 'package:kribb/app/auth/signup/content/signup_page_header.dart';
import 'package:kribb/src/constants/consts.dart';
import 'package:kribb/src/controllers/signup_controller.dart';
import 'package:kribb/src/utils/buttons/ios/cupertino_elevated_button.dart';
import 'package:kribb/theme/colors.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/utils/containers/text_form_field_container.dart';
import '../../../../../src/utils/text_form_fields/ios/cupertino_text_field.dart';
import '../../../login/login.dart';

class SignupCupertinoScaffold extends StatelessWidget {
  const SignupCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    final formKey = GlobalKey<FormState>();

    //=========== Controllers ===========\\
    final signupController = SignupController.instance;

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
            Form(
              key: formKey,
              child: Column(
                children: [
                  textFormFieldContainer(
                    colorScheme,
                    media,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: media.width - 50,
                          child: MyCupertinoTextField(
                            enabled: true,
                            controller: firstNameEC,
                            focusNode: firstNameFN,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            borderColor: kTransparentColor,
                            placeholder: "First Name",
                            validator: (value) {
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: signupController.isFirstNameValid.isTrue
                              ? FaIcon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  color: kSuccessColor,
                                )
                              : signupController.isFirstNameValid.isFalse
                                  ? FaIcon(
                                      FontAwesomeIcons.solidCircleXmark,
                                      color: kErrorColor,
                                    )
                                  : const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  kSizedBox,
                  textFormFieldContainer(
                    colorScheme,
                    media,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: media.width - 50,
                          child: MyCupertinoTextField(
                            enabled: true,
                            controller: lastNameEC,
                            focusNode: lastNameFN,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            borderColor: kTransparentColor,
                            keyboardType: TextInputType.name,
                            placeholder: "Last Name",
                            validator: (value) {
                              return null;
                            },
                            onSubmitted: (value) {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: signupController.isLastNameValid.isTrue
                              ? FaIcon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  color: kSuccessColor,
                                )
                              : signupController.isLastNameValid.isFalse
                                  ? FaIcon(
                                      FontAwesomeIcons.solidCircleXmark,
                                      color: kErrorColor,
                                    )
                                  : const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  kSizedBox,
                  textFormFieldContainer(
                    colorScheme,
                    media,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: media.width - 50,
                          child: MyCupertinoTextField(
                            enabled: true,
                            controller: emailEC,
                            focusNode: emailFN,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.emailAddress,
                            borderColor: kTransparentColor,
                            placeholder: "Email",
                            validator: (value) {
                              return null;
                            },
                            onSubmitted: (value) {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: signupController.isEmailValid.isTrue
                              ? FaIcon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  color: kSuccessColor,
                                )
                              : signupController.isEmailValid.isFalse
                                  ? FaIcon(
                                      FontAwesomeIcons.solidCircleXmark,
                                      color: kErrorColor,
                                    )
                                  : const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  kSizedBox,
                  textFormFieldContainer(
                    colorScheme,
                    media,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: media.width - 50,
                          child: MyCupertinoTextField(
                            enabled: true,
                            controller: phoneNumberEC,
                            focusNode: phoneNumberFN,
                            placeholder: "Phone number",
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            borderColor: kTransparentColor,
                            validator: (value) {
                              return null;
                            },
                            onSubmitted: (value) {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: signupController.isPhoneNumberValid.isTrue
                              ? FaIcon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  color: kSuccessColor,
                                )
                              : signupController.isPhoneNumberValid.isFalse
                                  ? FaIcon(
                                      FontAwesomeIcons.solidCircleXmark,
                                      color: kErrorColor,
                                    )
                                  : const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                  kSizedBox,
                  textFormFieldContainer(
                    colorScheme,
                    media,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: media.width - 50,
                          child: MyCupertinoTextField(
                            enabled: true,
                            controller: passwordEC,
                            focusNode: passwordFN,
                            textInputAction: TextInputAction.done,
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.visiblePassword,
                            borderColor: kTransparentColor,
                            placeholder: "Password",
                            validator: (value) {
                              return null;
                            },
                            onSubmitted: (value) {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: signupController.isPasswordValid.isTrue
                              ? FaIcon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  color: kSuccessColor,
                                )
                              : signupController.isPasswordValid.isFalse
                                  ? FaIcon(
                                      FontAwesomeIcons.solidCircleXmark,
                                      color: kErrorColor,
                                    )
                                  : const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: kDefaultPadding * 2),
            CupertinoElevatedButton(
              disable: signupController.isPasswordValid.value ? false : true,
              title: "Continue",
              onPressed: () {},
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
            CupertinoElevatedButton(
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
              onPressed: () {},
            ),
            kSizedBox,
            Align(
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
                        ..onTap = () {
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
                        },
                      style: defaultTextStyle(
                        color: kAccentColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
