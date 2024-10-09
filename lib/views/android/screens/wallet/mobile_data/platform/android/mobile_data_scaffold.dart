import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';

import '../../../../../../../src/controllers/app/mobile_data_controller.dart';
import '../../../../../../../src/utils/buttons/android/android_elevated_button.dart';
import '../../../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../../../src/utils/text_form_fields/android/android_textformfield.dart';
import '../../../../../../../theme/colors.dart';

class MobileDataScaffold extends GetView<MobileDataController> {
  const MobileDataScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(
        colorScheme,
        media,
        title: "Mobile Data",
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  formFieldContainer(
                    colorScheme,
                    media,
                    containerHeight: 55,
                    child: AndroidTextFormField(
                      labelText: "Biller",
                      readOnly: true,
                      onTap: controller.showListOfBillers,
                      controller: controller.billerEC,
                      focusNode: controller.billerFN,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  kSizedBox,
                  Obx(() {
                    return InkWell(
                      onTap: controller.mobilePlanFieldIsEnabled.value
                          ? controller.showListOfMobileDataPlans
                          : null,
                      borderRadius: BorderRadius.circular(10),
                      child: formFieldContainer(
                        colorScheme,
                        media,
                        containerHeight: 55,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.selectedMobileDataPlan.value.isEmpty
                                  ? "Select Plan"
                                  : controller.selectedMobileDataPlan.value,
                              textAlign: TextAlign.start,
                              style: defaultTextStyle(
                                color: controller
                                        .selectedMobileDataPlan.value.isEmpty
                                    ? kFormFieldTextColor.withOpacity(.5)
                                    : kFormFieldTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: colorScheme.inversePrimary,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  kSizedBox,
                  formFieldContainer(
                    colorScheme,
                    media,
                    containerHeight: 55,
                    child: AndroidTextFormField(
                      labelText: "Phone Number",
                      controller: controller.phoneNumberEC,
                      focusNode: controller.phoneNumberFN,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      onChanged: controller.phoneNumberOnChanged,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                      labelText: "Amount",
                      readOnly: true,
                      enabled: false,
                      controller: controller.amountEC,
                      textInputAction: TextInputAction.next,
                      focusNode: controller.amountFN,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                      labelText: "Description",
                      controller: controller.descriptionEC,
                      validator: (value) {
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      focusNode: controller.descriptionFN,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: controller.onFieldSubmitted,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: media.height * .12),
            GetBuilder<MobileDataController>(
              init: MobileDataController(),
              builder: (controller) {
                return AndroidElevatedButton(
                  title: "Pay",
                  isLoading: controller.isSubmitting.value,
                  onPressed: controller.submitMobileDataForm,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
