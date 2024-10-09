import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/utils/text_form_fields/android/android_textformfield.dart';

import '../../../../../../constants/consts.dart';
import '../../../../../../controllers/app/business_intro_controller.dart';
import '../../../../../../theme/colors.dart';
import '../../../../../../utils/containers/form_field_container.dart';

androidBusinessIntroPage3(
  Size media,
  ColorScheme colorScheme,
  BusinessIntroController controller,
) {
  return Column(
    children: [
      ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 40),
        leading: IconButton(
          onPressed: controller.navigateToPreviousPage,
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        horizontalTitleGap: (media.width - 280) / 1.2,
        title: Text(
          "My Business",
          maxLines: 10,
          style: defaultTextStyle(
            color: kTextBoldHeadingColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                width: .5,
                color: colorScheme.inversePrimary.withOpacity(.4),
              ),
            ),
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Text(
                  "What is the name of your business?",
                  textAlign: TextAlign.center,
                  maxLines: 10,
                  style: defaultTextStyle(
                    color: kTextBoldHeadingColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                kSizedBox,
                FadeInUp(
                  child: formFieldContainer(
                    colorScheme,
                    media,
                    child: AndroidTextFormField(
                      hintText: "Business name",
                      controller: controller.businessNameEC,
                      focusNode: controller.businessNameFN,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.sentences,
                      onFieldSubmitted: controller.onFieldSubmitted,
                      validator: (value) {
                        return;
                      },
                    ),
                  ),
                ),
                kBigSizedBox,
                Obx(
                  () {
                    return AndroidElevatedButton(
                      title: "Done",
                      isLoading: controller.isLoading.value,
                      onPressed: controller.submitForm,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}
