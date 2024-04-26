import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kribb/app/auth/forgot_password/content/forgot_password_page_header.dart';
import 'package:kribb/src/controllers/forgot_password_controller.dart';

import '../../../../../theme/colors.dart';

class ForgotPasswordCupertinoScaffold
    extends GetView<ForgotPasswordController> {
  const ForgotPasswordCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    final forgotPasswordController = ForgotPasswordController.instance;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "Login",
        transitionBetweenRoutes: true,
        backgroundColor: colorScheme.background,
        border: Border.all(color: kTransparentColor),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            forgotPasswordPageHeader(
              title: "Forgot Password",
              subtitle: "Select where you want us to send you an OTP",
              colorScheme: colorScheme,
              media: media,
            ),
          ],
        ),
      ),
    );
  }
}
