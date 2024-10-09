import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/auth/login_controller.dart';
import '../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../src/utils/text_form_fields/android/android_textformfield.dart';

androidLoginFormMobile(
  LoginController loginController,
  ColorScheme colorScheme,
  Size media,
) {
  return Form(
    key: loginController.formKey,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        formFieldContainer(
          colorScheme,
          media,
          child: AndroidTextFormField(
            readOnly: loginController.isLoading.value,
            controller: loginController.emailEC,
            focusNode: loginController.emailFN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            onChanged: loginController.emailOnChanged,
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
                  readOnly: loginController.isLoading.value,
                  controller: loginController.passwordEC,
                  focusNode: loginController.passwordFN,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.none,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: loginController.passwordIsHidden.value,
                  hintText: "Password",
                  onChanged: loginController.passwordOnChanged,
                  onFieldSubmitted: loginController.onSubmitted,
                  validator: (value) {
                    return null;
                  },
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  loginController.passwordIsHidden.value =
                      !loginController.passwordIsHidden.value;
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    color: colorScheme.inversePrimary,
                    size: 14,
                    loginController.passwordIsHidden.value
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
}
