import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kribb/app/auth/components/auth_app_bar.dart';
import 'package:kribb/app/auth/reset_password/content/reset_password_page_header.dart';
import 'package:kribb/src/utils/buttons/android/android_elevated_button.dart';
import 'package:kribb/src/utils/text_form_fields/android/android_textformfield.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/reset_password_controller.dart';
import '../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../theme/colors.dart';

class ResetPasswordScaffold extends GetView<ResetPasswordController> {
  const ResetPasswordScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var resetPasswordController = ResetPasswordController.instance;

    return Scaffold(
      appBar: authAppBar(
        media: media,
        colorScheme: colorScheme,
        isVisible: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            resetPasswordPageHeader(
              colorScheme: colorScheme,
              media: media,
              title: "Reset Password",
              subtitle: "Please enter your new password",
            ),
            const SizedBox(height: kDefaultPadding * 2),
            Obx(
              () {
                return Form(
                  key: resetPasswordController.formKey,
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
                              width: media.width - 120,
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
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      resetPasswordController
                                              .passwordIsHidden.value =
                                          !resetPasswordController
                                              .passwordIsHidden.value;
                                    },
                                    mouseCursor: SystemMouseCursors.click,
                                    tooltip: !resetPasswordController
                                            .passwordIsHidden.value
                                        ? "Show password"
                                        : "Hide password",
                                    icon: FaIcon(
                                      color: colorScheme.inversePrimary,
                                      size: 18,
                                      resetPasswordController
                                              .passwordIsHidden.value
                                          ? FontAwesomeIcons.solidEye
                                          : FontAwesomeIcons.solidEyeSlash,
                                    ),
                                  ),
                                  resetPasswordController.isPasswordValid.value
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
                          resetPasswordController.isPasswordValid.value
                              ? "Password meets the requirements"
                              : "Password must contain 8 characters,\na number,\n and a special character.",
                          textAlign: TextAlign.end,
                          style: defaultTextStyle(
                            color: resetPasswordController.isPasswordValid.value
                                ? kSuccessColor
                                : kErrorColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          ),
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
