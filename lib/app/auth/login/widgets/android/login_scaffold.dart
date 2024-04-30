import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/src/constants/consts.dart';
import 'package:kribb/src/utils/buttons/ios/cupertino_elevated_button.dart';
import 'package:kribb/theme/colors.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/controllers/login_controller.dart';
import '../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../src/utils/text_form_fields/android/android_textformfield.dart';
import '../../../components/auth_app_bar.dart';
import '../../content/login_page_header.dart';

class LoginScaffold extends GetView<LoginController> {
  const LoginScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    final loginController = LoginController.instance;

    return Scaffold(
      appBar: authAppBar(
        colorScheme: colorScheme,
        media: media,
        title: "Login",
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            loginPageHeader(colorScheme: colorScheme, media: media),
            const SizedBox(height: kDefaultPadding * 2),
            Obx(
              () {
                return Form(
                  key: loginController.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      formFieldContainer(
                        colorScheme,
                        media,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media.width - 80,
                              child: AndroidTextFormField(
                                readOnly: loginController.isLoading.value,
                                controller: loginController.emailEC,
                                focusNode: loginController.emailFN,
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.emailAddress,
                                hintText: "Email",
                                onChanged: loginController.emailOnChanged,
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: loginController.isEmailValid.value
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media.width - 120,
                              child: AndroidTextFormField(
                                readOnly: loginController.isLoading.value,
                                controller: loginController.passwordEC,
                                focusNode: loginController.passwordFN,
                                textInputAction: TextInputAction.done,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText:
                                    loginController.passwordIsHidden.value,
                                hintText: "Password",
                                onChanged: loginController.passwordOnChanged,
                                onFieldSubmitted: loginController.onSubmitted,
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
                                      loginController.passwordIsHidden.value =
                                          !loginController
                                              .passwordIsHidden.value;
                                    },
                                    mouseCursor: SystemMouseCursors.click,
                                    tooltip:
                                        !loginController.passwordIsHidden.value
                                            ? "Show password"
                                            : "Hide password",
                                    icon: FaIcon(
                                      color: colorScheme.inversePrimary,
                                      size: 18,
                                      loginController.passwordIsHidden.value
                                          ? FontAwesomeIcons.solidEye
                                          : FontAwesomeIcons.solidEyeSlash,
                                    ),
                                  ),
                                  loginController.isPasswordValid.value
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
                          loginController.isPasswordValid.value
                              ? "Password meets the requirements"
                              : "Password must contain 8 characters,\n a number and\n a special character.",
                          textAlign: TextAlign.end,
                          style: defaultTextStyle(
                            color: loginController.isPasswordValid.value
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
            kSizedBox,
            Obx(
              () {
                return Align(
                  alignment: Alignment.centerRight,
                  child: CupertinoButton(
                    onPressed: loginController.isLoading.value
                        ? null
                        : loginController.navigateToForgotPassword,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      width: media.width - 180,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: loginController.isLoading.value
                            ? colorScheme.inversePrimary
                            : Get.isDarkMode
                                ? kErrorColor.withOpacity(0.4).withOpacity(0.2)
                                : kErrorColor
                                    .withOpacity(0.4)
                                    .withOpacity(0.06),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.key,
                              color: loginController.isLoading.value
                                  ? kLightBackgroundColor
                                  : kErrorColor.withOpacity(0.4),
                              size: 12,
                            ),
                            kHalfWidthSizedBox,
                            Text(
                              "Forgot Password",
                              style: defaultTextStyle(
                                color: loginController.isLoading.value
                                    ? kLightBackgroundColor
                                    : kErrorColor.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: kDefaultPadding * 2),
            GetBuilder<LoginController>(
              init: LoginController(),
              builder: (context) {
                return CupertinoElevatedButton(
                  title: "Continue",
                  disable: loginController.formIsValid.isTrue ? false : true,
                  isLoading: loginController.isLoading.value,
                  onPressed: loginController.login,
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
                rowIconWidget: Image.asset(
                  Assets.googleIcon,
                  fit: BoxFit.fill,
                  height: min(60, 20),
                  width: 20,
                ),
                buttonColor: colorScheme.primary,
                textColor: colorScheme.background,
                onPressed: loginController.isLoading.value
                    ? null
                    : loginController.loginWithGoogle,
              ),
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
                      fontSize: 16.0,
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