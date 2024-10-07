import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/auth/phone_otp_controller.dart';
import '../../../../../src/utils/text_form_fields/android/android_textformfield.dart';

phoneOTPFormMobile(
  PhoneOTPController otpController,
  Size media,
  BuildContext context,
) {
  return Form(
    key: otpController.formKey,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: AndroidTextFormField(
            controller: otpController.pin1EC,
            focusNode: otpController.pin1FN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            inputBorder: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
            onChanged: (value) {
              otpController.pin1Onchanged(value, context);
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
            controller: otpController.pin2EC,
            focusNode: otpController.pin2FN,
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
              otpController.pin2Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        kSmallWidthSizedBox,
        Flexible(
          child: AndroidTextFormField(
            controller: otpController.pin3EC,
            focusNode: otpController.pin3FN,
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
              otpController.pin3Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        kSmallWidthSizedBox,
        Flexible(
          child: AndroidTextFormField(
            controller: otpController.pin4EC,
            focusNode: otpController.pin4FN,
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
              otpController.pin4Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        kSmallWidthSizedBox,
        Flexible(
          child: AndroidTextFormField(
            controller: otpController.pin5EC,
            focusNode: otpController.pin5FN,
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
              otpController.pin5Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        kSmallWidthSizedBox,
        Flexible(
          child: AndroidTextFormField(
            controller: otpController.pin6EC,
            focusNode: otpController.pin6FN,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            inputBorder: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
            onFieldSubmitted: otpController.onSubmitted,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              otpController.pin6Onchanged(value, context);
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
