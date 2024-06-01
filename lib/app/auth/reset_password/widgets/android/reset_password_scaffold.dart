import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suitess/app/auth/reset_password/content/reset_password_page_header.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/src/utils/text_form_fields/android/android_textformfield.dart';

import '../../../../../src/constants/assets.dart';
import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/auth/reset_password_controller.dart';
import '../../../../../src/utils/containers/form_field_container.dart';

class ResetPasswordScaffold extends GetView<ResetPasswordController> {
  const ResetPasswordScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var resetPasswordController = ResetPasswordController.instance;

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
            SvgPicture.asset(
              Assets.passwordSvg,
              fit: BoxFit.fitHeight,
              height: media.height * .2,
            ),
            kSizedBox,
            resetPasswordPageHeader(
              colorScheme: colorScheme,
              media: media,
              title: "Enter new password",
              subtitle:
                  "Your new password must be different from your the previously used password",
            ),
            const SizedBox(height: kDefaultPadding * 2),
            Obx(
              () {
                return Form(
                  key: resetPasswordController.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      formFieldContainer(
                        colorScheme,
                        media,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: AndroidTextFormField(
                                readOnly:
                                    resetPasswordController.isLoading.value,
                                controller: resetPasswordController.passwordEC,
                                focusNode: resetPasswordController.passwordFN,
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: resetPasswordController
                                    .passwordIsHidden.value,
                                hintText: "Password",
                                onChanged:
                                    resetPasswordController.passwordOnChanged,
                                onFieldSubmitted:
                                    resetPasswordController.onSubmitted,
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                resetPasswordController.passwordIsHidden.value =
                                    !resetPasswordController
                                        .passwordIsHidden.value;
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  color: colorScheme.inversePrimary,
                                  size: 14,
                                  resetPasswordController.passwordIsHidden.value
                                      ? Iconsax.eye4
                                      : Iconsax.eye_slash5,
                                ),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: AndroidTextFormField(
                                readOnly:
                                    resetPasswordController.isLoading.value,
                                controller: resetPasswordController.passwordEC,
                                focusNode: resetPasswordController.passwordFN,
                                textInputAction: TextInputAction.done,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: resetPasswordController
                                    .passwordIsHidden.value,
                                hintText: "Confirm Password",
                                onChanged:
                                    resetPasswordController.passwordOnChanged,
                                onFieldSubmitted:
                                    resetPasswordController.onSubmitted,
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                resetPasswordController.passwordIsHidden.value =
                                    !resetPasswordController
                                        .passwordIsHidden.value;
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  color: colorScheme.inversePrimary,
                                  size: 14,
                                  resetPasswordController.passwordIsHidden.value
                                      ? Iconsax.eye4
                                      : Iconsax.eye_slash5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: kDefaultPadding * 2),
            GetBuilder<ResetPasswordController>(
              init: ResetPasswordController(),
              builder: (context) {
                return AndroidElevatedButton(
                  title: "Continue",
                  disable:
                      resetPasswordController.formIsValid.isTrue ? false : true,
                  isLoading: resetPasswordController.isLoading.value,
                  onPressed: resetPasswordController.resetPassword,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
