import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../src/constants/consts.dart';
import '../../../../../../src/controllers/auth/reset_password_via_sms_otp_controller.dart';
import '../../../../../../src/utils/text_form_fields/android/android_textformfield.dart';

androidResetPasswordViaSmsOTPFormLandscape(
  ResetPasswordViaSmsOTPController resetPasswordViaSmsController,
  Size media,
  BuildContext context,
) {
  return Form(
    key: resetPasswordViaSmsController.formKey,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: AndroidTextFormField(
            controller: resetPasswordViaSmsController.pin1EC,
            focusNode: resetPasswordViaSmsController.pin1FN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            inputBorder: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
            onChanged: (value) {
              resetPasswordViaSmsController.pin1Onchanged(value, context);
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) {
              return null;
            },
          ),
        ),
        kSmallWidthSizedBox,
        Flexible(
          child: AndroidTextFormField(
            controller: resetPasswordViaSmsController.pin2EC,
            focusNode: resetPasswordViaSmsController.pin2FN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            inputBorder: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              resetPasswordViaSmsController.pin2Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        kSmallWidthSizedBox,
        Flexible(
          child: AndroidTextFormField(
            controller: resetPasswordViaSmsController.pin3EC,
            focusNode: resetPasswordViaSmsController.pin3FN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            inputBorder: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              resetPasswordViaSmsController.pin3Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        kSmallWidthSizedBox,
        Flexible(
          child: AndroidTextFormField(
            controller: resetPasswordViaSmsController.pin4EC,
            focusNode: resetPasswordViaSmsController.pin4FN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            inputBorder: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              resetPasswordViaSmsController.pin4Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        kSmallWidthSizedBox,
        Flexible(
          child: AndroidTextFormField(
            controller: resetPasswordViaSmsController.pin5EC,
            focusNode: resetPasswordViaSmsController.pin5FN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            inputBorder: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              resetPasswordViaSmsController.pin5Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        kSmallWidthSizedBox,
        Flexible(
          child: AndroidTextFormField(
            controller: resetPasswordViaSmsController.pin6EC,
            focusNode: resetPasswordViaSmsController.pin6FN,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            inputBorder: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
            onFieldSubmitted: resetPasswordViaSmsController.onSubmitted,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              resetPasswordViaSmsController.pin6Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
      ],
    ),
  );
}
