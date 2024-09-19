import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../src/constants/assets.dart';
import '../../../../src/controllers/app/chat_controller.dart';
import '../../../../src/utils/containers/form_field_container.dart';
import '../../../../src/utils/text_form_fields/android/android_textformfield.dart';
import '../../../../theme/colors.dart';

chatTextField(
  ColorScheme colorScheme,
  Size media,
  ChatController controller,
) {
  return Container(
    padding: EdgeInsets.only(
      left: 20,
      top: 10,
      right: 20,
      bottom: MediaQuery.of(Get.context!).viewInsets.bottom + 20,
    ),
    decoration: BoxDecoration(
      color: colorScheme.surface,
    ),
    child: formFieldContainer(
      colorScheme,
      media,
      borderRadius: 50,
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Expanded(
            child: AndroidTextFormField(
              hintText: "Message",
              keyboardType: TextInputType.multiline,
              controller: controller.chatEC,
              focusNode: controller.chatFN,
              textInputAction: TextInputAction.newline,
              maxLines: 100,
              textCapitalization: TextCapitalization.sentences,
              validator: (value) {
                return null;
              },
              onChanged: controller.chatTextFieldOnChanged,
              onFieldSubmitted: controller.chatTextFieldOnSubmitted,
            ),
          ),
          Obx(
            () {
              return IconButton(
                onPressed:
                    controller.canSubmit.isFalse ? null : controller.sendText,
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    controller.canSubmit.isFalse
                        ? colorScheme.inversePrimary
                        : colorScheme.secondary,
                  ),
                ),
                icon: SvgPicture.asset(
                  Assets.arrowUpSvg,
                  color: kWhiteBackgroundColor,
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}
