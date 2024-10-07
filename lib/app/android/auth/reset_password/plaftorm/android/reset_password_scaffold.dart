import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suitess/app/android/auth/reset_password/content/reset_password_page_header.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/src/utils/components/responsive_constants.dart';
import 'package:suitess/src/utils/text_form_fields/android/android_textformfield.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/controllers/auth/reset_password_controller.dart';
import '../../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../../theme/colors.dart';

class ResetPasswordScaffold extends GetView<ResetPasswordController> {
  const ResetPasswordScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = ResetPasswordController.instance;

    //Mobile Landscape mode or Large screens
    if (deviceType(media.width) > 1) {
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
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: media.width / 2.1,
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.passwordSvg,
                        fit: BoxFit.cover,
                        height: deviceType(media.width) > 2
                            ? media.height * .4
                            : media.height * .2,
                      ),
                      kSizedBox,
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: resetPasswordPageHeader(
                          colorScheme: colorScheme,
                          media: media,
                          title: "Enter new password",
                          subtitle:
                              "Your new password must be different from the previously used password.",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            kHalfWidthSizedBox,

            //Form
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1,
                      color: colorScheme.inversePrimary,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Obx(
                        () {
                          return Form(
                            key: controller.formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                formFieldContainer(
                                  colorScheme,
                                  media,
                                  containerHeight: media.height * .08,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: AndroidTextFormField(
                                          readOnly: controller.isLoading.value,
                                          controller: controller.passwordEC,
                                          focusNode: controller.passwordFN,
                                          textInputAction: TextInputAction.next,
                                          textCapitalization:
                                              TextCapitalization.none,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obscureText:
                                              controller.passwordIsHidden.value,
                                          hintText: "Password",
                                          onChanged:
                                              controller.passwordOnChanged,
                                          validator: (value) {
                                            return null;
                                          },
                                        ),
                                      ),
                                      InkWell(
                                        borderRadius: BorderRadius.circular(20),
                                        onTap: () {
                                          controller.passwordIsHidden.value =
                                              !controller
                                                  .passwordIsHidden.value;
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            color: colorScheme.inversePrimary,
                                            size: 14,
                                            controller.passwordIsHidden.value
                                                ? Iconsax.eye4
                                                : Iconsax.eye_slash5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    controller.isTypingPassword.isFalse
                                        ? ""
                                        : controller.isPasswordValid.value
                                            ? "Password meets the requirements"
                                            : "Password must contain 8 characters\n a number\n a special character.",
                                    textAlign: TextAlign.end,
                                    style: defaultTextStyle(
                                      color: controller.isPasswordValid.value
                                          ? kSuccessColor
                                          : kErrorColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                kSizedBox,
                                formFieldContainer(
                                  colorScheme,
                                  media,
                                  containerHeight: media.height * .08,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: AndroidTextFormField(
                                          readOnly: controller.isLoading.value,
                                          controller:
                                              controller.confirmPasswordEC,
                                          focusNode:
                                              controller.confirmPasswordFN,
                                          textInputAction: TextInputAction.done,
                                          textCapitalization:
                                              TextCapitalization.none,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obscureText: controller
                                              .confirmPasswordIsHidden.value,
                                          hintText: "Confirm Password",
                                          onChanged: controller
                                              .confirmPasswordOnChanged,
                                          onFieldSubmitted:
                                              controller.onSubmitted,
                                          validator: (value) {
                                            return null;
                                          },
                                        ),
                                      ),
                                      InkWell(
                                        borderRadius: BorderRadius.circular(20),
                                        onTap: () {
                                          controller.confirmPasswordIsHidden
                                                  .value =
                                              !controller
                                                  .confirmPasswordIsHidden
                                                  .value;
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            color: colorScheme.inversePrimary,
                                            size: 14,
                                            controller.confirmPasswordIsHidden
                                                    .value
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
                            title: "Reset Password",
                            disable:
                                controller.formIsValid.isTrue ? false : true,
                            isLoading: controller.isLoading.value,
                            onPressed: controller.resetPassword,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    //Mobile Portrait mode
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
                  "Your new password must be different from the previously used password.",
            ),
            const SizedBox(height: kDefaultPadding * 2),
            Obx(
              () {
                return Form(
                  key: controller.formKey,
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
                                readOnly: controller.isLoading.value,
                                controller: controller.passwordEC,
                                focusNode: controller.passwordFN,
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: controller.passwordIsHidden.value,
                                hintText: "Password",
                                onChanged: controller.passwordOnChanged,
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                controller.passwordIsHidden.value =
                                    !controller.passwordIsHidden.value;
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  color: colorScheme.inversePrimary,
                                  size: 14,
                                  controller.passwordIsHidden.value
                                      ? Iconsax.eye4
                                      : Iconsax.eye_slash5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          controller.isTypingPassword.isFalse
                              ? ""
                              : controller.isPasswordValid.value
                                  ? "Password meets the requirements"
                                  : "Password must contain 8 characters\n a number\n a special character.",
                          textAlign: TextAlign.end,
                          style: defaultTextStyle(
                            color: controller.isPasswordValid.value
                                ? kSuccessColor
                                : kErrorColor,
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
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
                                readOnly: controller.isLoading.value,
                                controller: controller.confirmPasswordEC,
                                focusNode: controller.confirmPasswordFN,
                                textInputAction: TextInputAction.done,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText:
                                    controller.confirmPasswordIsHidden.value,
                                hintText: "Confirm Password",
                                onChanged: controller.confirmPasswordOnChanged,
                                onFieldSubmitted: controller.onSubmitted,
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                controller.confirmPasswordIsHidden.value =
                                    !controller.confirmPasswordIsHidden.value;
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  color: colorScheme.inversePrimary,
                                  size: 14,
                                  controller.confirmPasswordIsHidden.value
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
                  title: "Reset Password",
                  disable: controller.formIsValid.isTrue ? false : true,
                  isLoading: controller.isLoading.value,
                  onPressed: controller.resetPassword,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
