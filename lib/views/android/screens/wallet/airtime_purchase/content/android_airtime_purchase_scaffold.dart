import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suitess/constants/consts.dart';
import 'package:suitess/utils/components/my_app_bar.dart';

import '../../../../../../controllers/app/airtime_controller.dart';
import '../../../../../../utils/buttons/android/android_elevated_button.dart';
import '../../../../../../utils/containers/form_field_container.dart';
import '../../../../../../utils/text_form_fields/android/android_textformfield.dart';

class AndroidAirtimePurchaseScaffold
    extends GetView<AirtimePurchaseController> {
  const AndroidAirtimePurchaseScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(
        colorScheme,
        media,
        title: "Airtime",
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
                      controller: controller.amountEC,
                      validator: (value) {
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      focusNode: controller.amountFN,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
            GetBuilder<AirtimePurchaseController>(
              init: AirtimePurchaseController(),
              builder: (controller) {
                return AndroidElevatedButton(
                  title: "Pay",
                  isLoading: controller.isSubmitting.value,
                  onPressed: controller.submitAirtimePurchaseForm,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
