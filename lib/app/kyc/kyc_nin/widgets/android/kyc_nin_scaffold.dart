import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suitess/app/auth/components/auth_app_bar.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';

import '../../../../../src/constants/consts.dart';
import '../../../../../src/controllers/kyc/kyc_nin_controller.dart';
import '../../../../../src/utils/containers/form_field_container.dart';
import '../../../../../src/utils/text_form_fields/ios/cupertino_text_field.dart';
import '../../../../../theme/colors.dart';
import '../../content/kyc_nin_page_header.dart';

class KycNinScaffold extends GetView<KycNINController> {
  const KycNinScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var kycNinController = KycNINController.instance;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: authAppBar(
        colorScheme: colorScheme,
        media: media,
        title: "NIN",
        faIcon: Icon(
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
                  key: kycNinController.formKey,
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
                                readOnly: kycNinController.isLoading.isFalse
                                    ? false
                                    : true,
                                controller: kycNinController.ninEC,
                                focusNode: kycNinController.ninFN,
                                placeholder: "Enter your NIN",
                                obscureText:
                                    !kycNinController.ninIsHidden.value,
                                textInputAction: TextInputAction.done,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.number,
                                borderColor: kTransparentColor,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                maxLength: 11,
                                onChanged: kycNinController.ninOnChanged,
                                onSubmitted: kycNinController.onSubmitted,
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
                                      kycNinController.ninIsHidden.value =
                                          !kycNinController.ninIsHidden.value;
                                    },
                                    mouseCursor: SystemMouseCursors.click,
                                    tooltip: kycNinController.ninIsHidden.value
                                        ? "Show NIN"
                                        : "Hide NIN",
                                    icon: Icon(
                                      color: colorScheme.inversePrimary,
                                      size: 18,
                                      kycNinController.ninIsHidden.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  kycNinController.isNinValid.value
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
                  isLoading: kycNinController.isLoading.value,
                  disable: kycNinController.formIsValid.value ? false : true,
                  onPressed: kycNinController.submit,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
