import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kribb/app/auth/signup/content/signup_cupertino_nav_bar.dart';
import 'package:kribb/app/auth/signup/content/signup_page_header.dart';
import 'package:kribb/src/constants/consts.dart';

import '../../../../../src/utils/containers/text_form_field_container.dart';

class SignupCupertinoScaffold extends StatelessWidget {
  const SignupCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    final formKey = GlobalKey<FormState>();

    //Form data\\
    //=========== Controllers ===========\\
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
            kSizedBox,
            kSizedBox,
            Form(
              key: formKey,
              child: Column(
                children: [
                  textFormFieldContainer(
                    colorScheme,
                    media,
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
