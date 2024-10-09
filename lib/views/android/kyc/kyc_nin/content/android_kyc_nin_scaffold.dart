import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suitess/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/views/android/auth/components/auth_app_bar.dart';

import '../../../../../constants/consts.dart';
import '../../../../../controllers/kyc/kyc_nin_controller.dart';
import '../../../../../theme/colors.dart';
import '../../../../../utils/containers/form_field_container.dart';
import '../../../../../utils/text_form_fields/ios/cupertino_text_field.dart';
import 'android_kyc_nin_page_header.dart';

class AndroidKycNinScaffold extends GetView<KycNINController> {
  const AndroidKycNinScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: androidAuthAppBar(
        colorScheme: colorScheme,
        media: media,
        title: "NIN",
        icon: Icon(
          Icons.business,
          color: kSuccessColor,
          size: 12,
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            kycNinPageHeader(
              colorScheme: colorScheme,
              media: media,
              title: "NIN Verification",
              subtitle:
                  "We need to verify your identity in agreement with our policies",
            ),
            const SizedBox(height: kDefaultPadding * 2),
            Obx(
              () {
                return Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      formFieldContainer(
                        colorScheme,
                        media,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media.width - 100,
                              child: MyCupertinoTextField(
                                readOnly:
                                    controller.isLoading.isFalse ? false : true,
                                controller: controller.ninEC,
                                focusNode: controller.ninFN,
                                placeholder: "Enter your NIN",
                                obscureText: !controller.ninIsHidden.value,
                                textInputAction: TextInputAction.done,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.number,
                                borderColor: kTransparentColor,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                maxLength: 11,
                                onChanged: controller.ninOnChanged,
                                onSubmitted: controller.onSubmitted,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      controller.ninIsHidden.value =
                                          !controller.ninIsHidden.value;
                                    },
                                    mouseCursor: SystemMouseCursors.click,
                                    tooltip: controller.ninIsHidden.value
                                        ? "Show NIN"
                                        : "Hide NIN",
                                    icon: Icon(
                                      color: colorScheme.inversePrimary,
                                      size: 18,
                                      controller.ninIsHidden.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  controller.isNinValid.value
                                      ? Icon(
                                          Icons.check,
                                          color: kSuccessColor,
                                        )
                                      : Icon(
                                          Icons.clear,
                                          color: kErrorColor,
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            kSizedBox,
            const SizedBox(height: kDefaultPadding * 2),
            GetBuilder<KycNINController>(
              builder: (controller) {
                return AndroidElevatedButton(
                  title: "Continue",
                  isLoading: controller.isLoading.value,
                  disable: controller.formIsValid.value ? false : true,
                  onPressed: controller.submit,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
