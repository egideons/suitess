import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kribb/app/auth/signup/content/auth_cupertino_nav_bar.dart';
import 'package:kribb/app/auth/signup/content/signup_page_header.dart';
import 'package:kribb/src/constants/consts.dart';
import 'package:kribb/src/controllers/signup_controller.dart';
import 'package:kribb/src/utils/buttons/ios/cupertino_elevated_button.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/utils/containers/text_form_field_container.dart';
import '../../../../../src/utils/text_form_fields/ios/cupertino_text_field.dart';

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
                    child: MyCupertinoTextField(
                      enabled: true,
                      controller: firstNameEC,
                      focusNode: firstNameFN,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      placeholder: "First Name",
                      validator: (value) {
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                  ),
                  kSizedBox,
                  textFormFieldContainer(
                    colorScheme,
                    media,
                    child: MyCupertinoTextField(
                      enabled: true,
                      controller: lastNameEC,
                      focusNode: lastNameFN,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.name,
                      placeholder: "Last Name",
                      validator: (value) {
                        return null;
                      },
                      onSubmitted: (value) {},
                    ),
                  ),
                  kSizedBox,
                  textFormFieldContainer(
                    colorScheme,
                    media,
                    child: MyCupertinoTextField(
                      enabled: true,
                      controller: emailEC,
                      focusNode: emailFN,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.emailAddress,
                      placeholder: "Email",
                      validator: (value) {
                        return null;
                      },
                      onSubmitted: (value) {},
                    ),
                  ),
                  kSizedBox,
                  textFormFieldContainer(
                    colorScheme,
                    media,
                    child: MyCupertinoTextField(
                      enabled: true,
                      controller: phoneNumberEC,
                      focusNode: phoneNumberFN,
                      placeholder: "Phone number",
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        return null;
                      },
                      onSubmitted: (value) {},
                    ),
                  ),
                  kSizedBox,
                  textFormFieldContainer(
                    colorScheme,
                    media,
                    child: MyCupertinoTextField(
                      enabled: true,
                      controller: passwordEC,
                      focusNode: passwordFN,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.visiblePassword,
                      placeholder: "Password",
                      validator: (value) {
                        return null;
                      },
                      onSubmitted: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: kDefaultPadding * 2),
            CupertinoElevatedButton(
              disable: true,
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
          ],
        ),
      ),
    );
  }
}
