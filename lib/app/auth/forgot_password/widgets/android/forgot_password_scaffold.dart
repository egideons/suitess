import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suitess/app/auth/forgot_password/content/forgot_password_page_header.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/controllers/auth/forgot_password_controller.dart';
import 'package:suitess/src/utils/components/loading_indicator.dart';

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
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Iconsax.arrow_left_2,
            color: colorScheme.primary,
          ),
        ),
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
              title: "Oh no, did you forget your password?",
              subtitle: "Select an option below to receive an OTP",
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
                      ? kSuccessColor
                      : colorScheme.inversePrimary.withOpacity(0.2),
                  titleColor: forgotPasswordController.items[0]
                      ? kLightBackgroundColor
                      : colorScheme.inversePrimary,
                  iconColor: forgotPasswordController.items[0]
                      ? kLightBackgroundColor
                      : colorScheme.inversePrimary,
                  faIcon: Icon(
                    Iconsax.sms5,
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
                      ? kSuccessColor
                      : colorScheme.inversePrimary.withOpacity(0.2),
                  titleColor: forgotPasswordController.items[1]
                      ? kLightBackgroundColor
                      : colorScheme.inversePrimary,
                  iconColor: forgotPasswordController.items[1]
                      ? kLightBackgroundColor
                      : colorScheme.inversePrimary,
                  faIcon: Icon(
                    Iconsax.message5,
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
