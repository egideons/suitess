import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kribb/app/auth/signup/content/signup_cupertino_nav_bar.dart';
import 'package:kribb/app/auth/signup/content/signup_page_header.dart';
import 'package:kribb/src/constants/consts.dart';
import 'package:kribb/src/controllers/signup_controller.dart';

import '../../../../../src/utils/text_form_fields/ios/cupertino_text_field.dart';

class SignupCupertinoScaffold extends StatelessWidget {
  const SignupCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    final formKey = GlobalKey<FormState>();

    //=========== Controllers ===========\\
    final controller = SignupController.instance;

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
      navigationBar:
          signupCupertinoNavBar(colorScheme: colorScheme, media: media),
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
                  // textFormFieldContainer(colorScheme, media),
                  MyCupertinoTextField(
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
                    onSubmitted: (value) {},
                  ),
                  kSizedBox,
                  MyCupertinoTextField(
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
                  kSizedBox,
                  MyCupertinoTextField(
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
                  kSizedBox,
                  MyCupertinoTextField(
                    enabled: true,
                    controller: phoneNumberEC,
                    focusNode: phoneNumberFN,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.phone,
                    placeholder: "Phone number",
                    validator: (value) {
                      return null;
                    },
                    onSubmitted: (value) {},
                  ),
                  kSizedBox,
                  MyCupertinoTextField(
                    enabled: true,
                    controller: passwordEC,
                    focusNode: passwordFN,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.visiblePassword,
                    placeholder: "Password",
                    validator: (value) {
                      return null;
                    },
                    onSubmitted: (value) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
