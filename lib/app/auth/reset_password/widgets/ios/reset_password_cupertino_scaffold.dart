import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/auth/components/auth_cupertino_nav_bar.dart';
import 'package:suitess/app/auth/reset_password/content/reset_password_page_header.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/auth/reset_password_controller.dart';
import '../../../../../src/utils/buttons/ios/cupertino_elevated_button.dart';
import '../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../src/utils/text_form_fields/ios/cupertino_text_field.dart';
import '../../../../../theme/colors.dart';

class ResetPasswordCupertinoScaffold extends GetView<ResetPasswordController> {
  const ResetPasswordCupertinoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var resetPasswordController = ResetPasswordController.instance;

    return CupertinoPageScaffold(
      navigationBar: authCupertinoNavBar(
        previousPageTitle: "Back",
        media: media,
        colorScheme: colorScheme,
        isVisible: false,
      ),
      child: SafeArea(
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
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media.width - 100,
                              child: MyCupertinoTextField(
                                readOnly:
                                    resetPasswordController.isLoading.value,
                                controller: resetPasswordController.passwordEC,
                                focusNode: resetPasswordController.passwordFN,
                                textInputAction: TextInputAction.done,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.visiblePassword,
                                borderColor: kTransparentColor,
                                obscureText: resetPasswordController
                                    .passwordIsHidden.value,
                                placeholder: "Password",
                                onChanged:
                                    resetPasswordController.passwordOnChanged,
                                onSubmitted:
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
                                    icon: Icon(
                                      color: colorScheme.inversePrimary,
                                      size: 18,
                                      resetPasswordController
                                              .passwordIsHidden.value
                                          ? CupertinoIcons.eye_fill
                                          : CupertinoIcons.eye_slash_fill,
                                    ),
                                  ),
                                  resetPasswordController.isPasswordValid.value
                                      ? Icon(
                                          CupertinoIcons.clear_thick_circled,
                                          color: kSuccessColor,
                                        )
                                      : Icon(
                                          CupertinoIcons.clear_thick_circled,
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
                return CupertinoElevatedButton(
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
