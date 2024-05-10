import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/app/auth/forgot_password/content/forgot_password_page_header.dart';
import 'package:kribb/src/constants/consts.dart';
import 'package:kribb/src/controllers/auth/forgot_password_controller.dart';
import 'package:kribb/src/utils/components/loading_indicator.dart';

import '../../../../../theme/colors.dart';
import 'forgot_password_android_button.dart';

class ForgotPasswordScaffold extends GetView<ForgotPasswordController> {
  const ForgotPasswordScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    final forgotPasswordController = ForgotPasswordController.instance;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.background,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Obx(
              () => forgotPasswordController.isLoading.value
                  ? loadingIndicator(media: media)
                  : const SizedBox(),
            ),
            forgotPasswordPageHeader(
              title: "Forgot Password",
              subtitle: "Select where you want us to send you an OTP",
              colorScheme: colorScheme,
              media: media,
            ),
            const SizedBox(height: kDefaultPadding * 2),
            Obx(
              () {
                return forgotPasswordAndroidButton(
                  media,
                  title: "Email",
                  forgotPasswordController.isLoading.value
                      ? null
                      : forgotPasswordController.navigateToEmail,
                  bgColor: forgotPasswordController.items[0]
                      ? kSuccessColor.withOpacity(0.8)
                      : colorScheme.inversePrimary.withOpacity(0.2),
                  titleColor: forgotPasswordController.items[0]
                      ? kLightBackgroundColor
                      : colorScheme.inversePrimary,
                  iconColor: forgotPasswordController.items[0]
                      ? kLightBackgroundColor
                      : colorScheme.inversePrimary,
                  faIcon: FaIcon(
                    FontAwesomeIcons.solidEnvelope,
                    color: forgotPasswordController.items[0]
                        ? kLightBackgroundColor
                        : colorScheme.inversePrimary,
                  ),
                );
              },
            ),
            kSizedBox,
            Obx(
              () {
                return forgotPasswordAndroidButton(
                  media,
                  title: "SMS",
                  forgotPasswordController.isLoading.value
                      ? null
                      : forgotPasswordController.navigateToSMS,
                  bgColor: forgotPasswordController.items[1]
                      ? kSuccessColor.withOpacity(0.8)
                      : colorScheme.inversePrimary.withOpacity(0.2),
                  titleColor: forgotPasswordController.items[1]
                      ? kLightBackgroundColor
                      : colorScheme.inversePrimary,
                  iconColor: forgotPasswordController.items[1]
                      ? kLightBackgroundColor
                      : colorScheme.inversePrimary,
                  faIcon: FaIcon(
                    FontAwesomeIcons.solidMessage,
                    color: forgotPasswordController.items[1]
                        ? kLightBackgroundColor
                        : colorScheme.inversePrimary,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
