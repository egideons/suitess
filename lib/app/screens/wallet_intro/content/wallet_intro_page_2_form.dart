import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../src/constants/consts.dart';
import '../../../../src/controllers/app/wallet_intro_controller.dart';
import '../../../../src/utils/containers/form_field_container.dart';
import '../../../../src/utils/text_form_fields/android/android_textformfield.dart';

walletIntroPage2Form(
  ColorScheme colorScheme,
  Size media,
  WalletIntroController controller,
) {
  return Column(
    children: [
      formFieldContainer(
        colorScheme,
        media,
        containerHeight: 55,
        child: AndroidTextFormField(
          labelText: "BVN",
          controller: controller.bvnEC,
          textInputAction: TextInputAction.next,
          focusNode: controller.bvnFN,
          textCapitalization: TextCapitalization.none,
          keyboardType: TextInputType.number,
          onChanged: controller.bvnOnChanged,
          validator: (value) {
            return null;
          },
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(11),
          ],
        ),
      ),
      kSizedBox,
      formFieldContainer(
        colorScheme,
        media,
        containerHeight: 55,
        child: AndroidTextFormField(
          labelText: "Phone Number",
          controller: controller.phoneNumberEC,
          textInputAction: TextInputAction.done,
          focusNode: controller.phoneNumberFN,
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
        containerHeight: 55,
        child: AndroidTextFormField(
          labelText: "Date of Birth (DoB)",
          onTap: controller.selectDoBFunc,
          readOnly: true,
          controller: controller.dobEC,
          focusNode: controller.dobFN,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.none,
          validator: (value) {
            return null;
          },
        ),
      ),
      kBigSizedBox,
    ],
  );
}
