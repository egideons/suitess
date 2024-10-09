import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suitess/views/android/auth/components/auth_app_bar.dart';

import '../../../../../constants/consts.dart';
import '../../../../../controllers/kyc/kyc_bvn_controller.dart';
import '../../../../../theme/colors.dart';
import '../../../../../utils/buttons/ios/cupertino_elevated_button.dart';
import '../../../../../utils/containers/form_field_container.dart';
import '../../../../../utils/text_form_fields/ios/cupertino_text_field.dart';
import 'android_kyc_bvn_page_header.dart';

class AndroidKycBvnScaffold extends GetView<KycBvnController> {
  const AndroidKycBvnScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: androidAuthAppBar(
        colorScheme: colorScheme,
        media: media,
        title: "BVN",
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
            androidKycBvnPageHeader(
              colorScheme: colorScheme,
              media: media,
              title: "BVN Verification",
              subtitle:
                  "We need to verify your account for in-app transactions",
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
                                controller: controller.bvnEC,
                                focusNode: controller.bvnFN,
                                placeholder: "Enter your BVN",
                                obscureText: !controller.bvnIsHidden.value,
                                textInputAction: TextInputAction.done,
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.number,
                                borderColor: kTransparentColor,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                maxLength: 11,
                                onChanged: controller.bvnOnChanged,
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
                                      controller.bvnIsHidden.value =
                                          !controller.bvnIsHidden.value;
                                    },
                                    mouseCursor: SystemMouseCursors.click,
                                    tooltip: controller.bvnIsHidden.value
                                        ? "Show BVN"
                                        : "Hide BVN",
                                    icon: Icon(
                                      color: colorScheme.inversePrimary,
                                      size: 18,
                                      controller.bvnIsHidden.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  controller.isBvnValid.value
                                      ? Icon(
                                          Icons.check_circle,
                                          color: kSuccessColor,
                                        )
                                      : Icon(
                                          Icons.check_circle,
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
            GetBuilder<KycBvnController>(
              builder: (controller) {
                return CupertinoElevatedButton(
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
