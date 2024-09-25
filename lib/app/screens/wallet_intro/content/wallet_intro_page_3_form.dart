import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suitess/src/controllers/app/wallet_intro_controller.dart';
import 'package:suitess/src/utils/containers/form_field_container.dart';
import 'package:suitess/src/utils/text_form_fields/android/android_textformfield.dart';

walletIntroPage3Form(WalletIntroController controller, ColorScheme colorScheme,
    Size media, BuildContext context) {
  return Form(
    key: controller.form2Key,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        formFieldContainer(
          colorScheme,
          media,
          containerWidth: 60,
          containerHeight: 60,
          child: AndroidTextFormField(
            controller: controller.txPin1EC,
            focusNode: controller.txPin1FN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              controller.txPin1Onchanged(value, context);
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
        formFieldContainer(
          colorScheme,
          media,
          containerWidth: 60,
          containerHeight: 60,
          child: AndroidTextFormField(
            controller: controller.txPin2EC,
            focusNode: controller.txPin2FN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              controller.txPin2Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        formFieldContainer(
          colorScheme,
          media,
          containerWidth: 60,
          containerHeight: 60,
          child: AndroidTextFormField(
            controller: controller.txPin3EC,
            focusNode: controller.txPin3FN,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              controller.txPin3Onchanged(value, context);
            },
            validator: (value) {
              return null;
            },
          ),
        ),
        formFieldContainer(
          colorScheme,
          media,
          containerWidth: 60,
          containerHeight: 60,
          child: AndroidTextFormField(
            controller: controller.txPin4EC,
            focusNode: controller.txPin4FN,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            onFieldSubmitted: controller.onTxPinSubmitted,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              controller.txPin4Onchanged(value, context);
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
