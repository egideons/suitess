import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/auth/signup_controller.dart';
import '../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../src/utils/text_form_fields/android/android_textformfield.dart';
import '../../../../../theme/colors.dart';

androidSignupFormMobile(
  SignupController controller,
  ColorScheme colorScheme,
  Size media,
) {
  return Form(
    key: controller.formKey,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        formFieldContainer(
          colorScheme,
          media,
          child: AndroidTextFormField(
            controller: controller.firstNameEC,
            focusNode: controller.firstNameFN,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            hintText: "First Name",
            onChanged: controller.firstNameOnChanged,
            validator: (value) {
              return null;
            },
          ),
        ),
        kSizedBox,
        formFieldContainer(
          colorScheme,
          media,
          child: AndroidTextFormField(
            hintText: "Last Name",
            controller: controller.lastNameEC,
            focusNode: controller.lastNameFN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.name,
            onChanged: controller.lastNameOnChanged,
            validator: (value) {
              return null;
            },
          ),
        ),
        kSizedBox,
        formFieldContainer(
          colorScheme,
          media,
          child: AndroidTextFormField(
            controller: controller.emailEC,
            focusNode: controller.emailFN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            onChanged: controller.emailOnChanged,
            validator: (value) {
              return null;
            },
          ),
        ),
        kSizedBox,
        formFieldContainer(
          colorScheme,
          media,
          child: AndroidTextFormField(
            controller: controller.phoneNumberEC,
            focusNode: controller.phoneNumberFN,
            hintText: "Phone number",
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.phone,
            onChanged: controller.phoneNumberOnChanged,
            validator: (value) {
              return null;
            },
          ),
        ),
        kSizedBox,
        formFieldContainer(
          colorScheme,
          media,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: AndroidTextFormField(
                  controller: controller.passwordEC,
                  focusNode: controller.passwordFN,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.none,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.passwordIsHidden.value,
                  hintText: "Password",
                  onChanged: controller.passwordOnChanged,
                  onFieldSubmitted: controller.onSubmitted,
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
      ],
    ),
  );
}
