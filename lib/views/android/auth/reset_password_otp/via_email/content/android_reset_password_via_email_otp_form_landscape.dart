import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../constants/consts.dart';
import '../../../../../../controllers/auth/reset_password_via_email_otp_controller.dart';
import '../../../../../../utils/text_form_fields/android/android_textformfield.dart';

androidResetPasswordViaEmailOTPFormLandscape(
  ResetPasswordViaEmailOTPController resetPasswordViaEmailController,
  Size media,
  BuildContext context,
) {
  return Form(
    key: resetPasswordViaEmailController.formKey,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: AndroidTextFormField(
            controller: resetPasswordViaEmailController.pin1EC,
            focusNode: resetPasswordViaEmailController.pin1FN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            inputBorder: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
            onChanged: (value) {
              resetPasswordViaEmailController.pin1Onchanged(value, context);
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
            controller: resetPasswordViaEmailController.pin2EC,
            focusNode: resetPasswordViaEmailController.pin2FN,
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
              resetPasswordViaEmailController.pin2Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        kSmallWidthSizedBox,
        Flexible(
          child: AndroidTextFormField(
            controller: resetPasswordViaEmailController.pin3EC,
            focusNode: resetPasswordViaEmailController.pin3FN,
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
              resetPasswordViaEmailController.pin3Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        kSmallWidthSizedBox,
        Flexible(
          child: AndroidTextFormField(
            controller: resetPasswordViaEmailController.pin4EC,
            focusNode: resetPasswordViaEmailController.pin4FN,
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
              resetPasswordViaEmailController.pin4Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        kSmallWidthSizedBox,
        Flexible(
          child: AndroidTextFormField(
            controller: resetPasswordViaEmailController.pin5EC,
            focusNode: resetPasswordViaEmailController.pin5FN,
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
              resetPasswordViaEmailController.pin5Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        kSmallWidthSizedBox,
        Flexible(
          child: AndroidTextFormField(
            controller: resetPasswordViaEmailController.pin6EC,
            focusNode: resetPasswordViaEmailController.pin6FN,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            inputBorder: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
            onFieldSubmitted: resetPasswordViaEmailController.onSubmitted,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              resetPasswordViaEmailController.pin6Onchanged(value, context);
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
