import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/controllers/app/contact_details_controller.dart';
import 'package:suitess/theme/colors.dart';
import 'package:suitess/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/utils/containers/form_field_container.dart';
import 'package:suitess/utils/text_form_fields/android/android_textformfield.dart';

import '../../../../../../../constants/consts.dart';

androidEditUserNameDialog(
  Size media,
  ColorScheme colorScheme,
  ContactDetailsScreenController controller,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 60),
    child: Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Scaffold(
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  tooltip: "Close",
                  padding: const EdgeInsets.all(0),
                  icon: Icon(
                    Icons.close,
                    size: 20,
                    color: kGreyColor,
                  ),
                  onPressed: () {
                    Get.close(0);
                  },
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    Text(
                      "User Name",
                      textAlign: TextAlign.center,
                      style: defaultTextStyle(
                        color: kTextBoldHeadingColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    kSizedBox,
                    Form(
                      key: controller.userNameFormKey,
                      child: formFieldContainer(
                        colorScheme,
                        media,
                        containerHeight: 55,
                        child: AndroidTextFormField(
                          labelText: "Username",
                          controller: controller.userNameEC,
                          focusNode: controller.businessNameFN,
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.name,
                          onFieldSubmitted: controller.userNameOnSubmitted,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                    ),
                    kBigSizedBox,
                    Obx(
                      () {
                        return AndroidElevatedButton(
                          title: "Save",
                          isLoading: controller.isSavingUserName.value,
                          onPressed: controller.saveUserName,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
