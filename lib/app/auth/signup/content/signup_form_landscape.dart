import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../src/constants/consts.dart';
import '../../../../src/controllers/auth/signup_controller.dart';
import '../../../../src/utils/containers/form_field_container.dart';
import '../../../../src/utils/text_form_fields/android/android_textformfield.dart';
import '../../../../theme/colors.dart';

signupFormLandscape(
  SignupController signupController,
  ColorScheme colorScheme,
  Size media,
) {
  return Form(
    key: signupController.formKey,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        formFieldContainer(
          colorScheme,
          media,
          containerHeight: media.height * .08,
          child: AndroidTextFormField(
            controller: signupController.firstNameEC,
            focusNode: signupController.firstNameFN,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            hintText: "First Name",
            onChanged: signupController.firstNameOnChanged,
            validator: (value) {
              return null;
            },
          ),
        ),
        kSizedBox,
        formFieldContainer(
          colorScheme,
          media,
          containerHeight: media.height * .08,
          child: AndroidTextFormField(
            hintText: "Last Name",
            controller: signupController.lastNameEC,
            focusNode: signupController.lastNameFN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.name,
            onChanged: signupController.lastNameOnChanged,
            validator: (value) {
              return null;
            },
          ),
        ),
        kSizedBox,
        formFieldContainer(
          colorScheme,
          media,
          containerHeight: media.height * .08,
          child: AndroidTextFormField(
            controller: signupController.emailEC,
            focusNode: signupController.emailFN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            onChanged: signupController.emailOnChanged,
            validator: (value) {
              return null;
            },
          ),
        ),
        kSizedBox,
        formFieldContainer(
          colorScheme,
          media,
          containerHeight: media.height * .08,
          child: AndroidTextFormField(
            controller: signupController.phoneNumberEC,
            focusNode: signupController.phoneNumberFN,
            hintText: "Phone number",
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.phone,
            onChanged: signupController.phoneNumberOnChanged,
            validator: (value) {
              return null;
            },
          ),
        ),
        kSizedBox,
        formFieldContainer(
          colorScheme,
          media,
          containerHeight: media.height * .08,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: AndroidTextFormField(
                  controller: signupController.passwordEC,
                  focusNode: signupController.passwordFN,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.none,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: signupController.passwordIsHidden.value,
                  hintText: "Password",
                  onChanged: signupController.passwordOnChanged,
                  onFieldSubmitted: signupController.onSubmitted,
                  validator: (value) {
                    return null;
                  },
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  signupController.passwordIsHidden.value =
                      !signupController.passwordIsHidden.value;
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    color: colorScheme.inversePrimary,
                    size: 14,
                    signupController.passwordIsHidden.value
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
            signupController.isTypingPassword.isFalse
                ? ""
                : signupController.isPasswordValid.value
                    ? "Password meets the requirements"
                    : "Password must contain 8 characters\n a number\n a special character.",
            textAlign: TextAlign.end,
            style: defaultTextStyle(
              color: signupController.isPasswordValid.value
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
