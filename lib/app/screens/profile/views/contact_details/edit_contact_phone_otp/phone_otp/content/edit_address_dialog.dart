import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/app/screens/profile/views/contact_details/edit_contact_phone_otp/phone_otp/content/address_suggestion.dart';
import 'package:suitess/src/controllers/app/contact_details_controller.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/src/utils/containers/form_field_container.dart';
import 'package:suitess/src/utils/text_form_fields/android/android_textformfield.dart';
import 'package:suitess/theme/colors.dart';

import '../../../../../../../../src/constants/consts.dart';

editAddressDialog(
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
                      "Edit Address",
                      textAlign: TextAlign.center,
                      style: defaultTextStyle(
                        color: kTextBoldHeadingColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    kSizedBox,
                    Form(
                      key: controller.phoneFormKey,
                      child: formFieldContainer(
                        colorScheme,
                        media,
                        containerHeight: 55,
                        child: AndroidTextFormField(
                          labelText: "Address",
                          controller: controller.addressEC,
                          focusNode: controller.addressFN,
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.streetAddress,
                          onChanged: controller.addressOnChanged,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                    ),
                    Obx(() {
                      return controller.mapSuggestionsIsVisible.value
                          ? SizedBox(
                              height: 200,
                              child: Column(
                                children: [
                                  kSizedBox,
                                  Expanded(
                                    child: ListView.separated(
                                      itemCount: 20,
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      separatorBuilder: (context, index) =>
                                          kSmallSizedBox,
                                      itemBuilder: (context, index) {
                                        return addressSuggestion(
                                          media,
                                          colorScheme,
                                          controller,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox();
                    }),
                    kBigSizedBox,
                    Obx(
                      () {
                        return AndroidElevatedButton(
                          title: "Save",
                          isLoading: controller.isSavingAddress.value,
                          onPressed: controller.saveAddress,
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
